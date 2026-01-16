import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:sillicon_power/core/di/services/isar_service.dart';
import '../../data/datasources/offline_datasource.dart';
import '../../data/datasources/tmdb_datasource.dart';
import '../../data/repositories/tv_show_repository_impl.dart';
import '../../domain/repositories/tv_show_repository.dart';
import '../../domain/usecases/fetch_popular_tv_shows.dart';
import '../../domain/usecases/fetch_total_pages.dart';
import '../../domain/usecases/fetch_tv_show_genre_map.dart';
import '../../presentation/bloc/popular_tv/popular_tv_bloc.dart';

final getIt = GetIt.instance;

Future<void> setupDependencies() async {
  // Initialize Isar Service
  final isarService = IsarService();
  await isarService.init();
  getIt.registerSingleton<IsarService>(isarService);
  getIt.registerSingleton<Isar>(isarService.isar);

  // Datasources
  getIt.registerLazySingleton<TmdbDatasource>(() => TmdbDatasource());
  getIt.registerLazySingleton<OfflineDatasource>(
    () => OfflineDatasource(getIt<Isar>()),
  );

  // Repositories
  getIt.registerLazySingleton<TVShowRepository>(
    () => TVShowRepositoryImpl(
      getIt<TmdbDatasource>(),
      getIt<OfflineDatasource>(),
    ),
  );

  // Usecases
  getIt.registerLazySingleton(() => FetchPopularTVShows(getIt<TVShowRepository>()));
  getIt.registerLazySingleton(() => FetchTotalPages(getIt<TVShowRepository>()));
  getIt.registerLazySingleton(() => FetchTvShowGenreMap(getIt<TVShowRepository>()));

  // BLoCs
  getIt.registerFactory(() => PopularTVBloc(
        fetchPopularTVShows: getIt<FetchPopularTVShows>(),
        fetchTotalPages: getIt<FetchTotalPages>(),
        fetchTvShowGenreMap: getIt<FetchTvShowGenreMap>(),
        repository: getIt<TVShowRepository>(),
      ));
}
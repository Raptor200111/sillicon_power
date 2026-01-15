import 'package:get_it/get_it.dart';
import 'package:sillicon_power/core/di/services/isar_service.dart';
import 'package:sillicon_power/data/datasources/tmdb_datasource.dart';
import 'package:sillicon_power/presentation/theme/language_provider.dart';
import '../../data/datasources/local_tv_show_datasource.dart';
import '../../data/repositories/tv_show_repository_impl.dart';
import '../../domain/repositories/tv_show_repository.dart';
import '../../domain/usecases/fetch_popular_tv_shows.dart';
import '../../domain/usecases/fetch_total_pages.dart';
import '../../domain/usecases/fetch_tv_show_genre_map.dart';
import '../../presentation/bloc/popular_tv/popular_tv_bloc.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  // Services
  getIt.registerLazySingleton<IsarService>(() => IsarService());

  // Providers
  getIt.registerLazySingleton<LanguageProvider>(() => LanguageProvider());

  // Datasources
  getIt.registerLazySingleton<TmdbTvShowDatasource>(() => TmdbTvShowDatasource());
  getIt.registerLazySingleton<LocalTvShowDatasource>(
    () => LocalTvShowDatasource(getIt<IsarService>()),
  );

  // Repositories
  getIt.registerLazySingleton<TVShowRepository>(
    () => TVShowRepositoryImpl(
      getIt<TmdbTvShowDatasource>(),
      getIt<LocalTvShowDatasource>(),
    ),
  );

  // Usecases
  getIt.registerLazySingleton(() => FetchPopularTVShows(getIt<TVShowRepository>()));
  getIt.registerLazySingleton(() => FetchTotalPages(getIt<TVShowRepository>()));
  getIt.registerLazySingleton(() => FetchTvShowGenreMap(getIt<TVShowRepository>()));

  // BLoCs
  getIt.registerLazySingleton(
    () => PopularTVBloc(
      fetchPopularTVShows: getIt<FetchPopularTVShows>(),
      fetchTotalPages: getIt<FetchTotalPages>(),
      fetchTvShowGenreMap:  getIt<FetchTvShowGenreMap>(),
    ),
  );
}
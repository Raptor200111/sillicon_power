import 'package:get_it/get_it.dart';
import '../../data/datasources/tmdb_datasource.dart';
import '../../data/repositories/tv_show_repository_impl.dart';
import '../../domain/repositories/tv_show_repository.dart';
import '../../domain/usecases/fetch_popular_tv_shows.dart';
import '../../domain/usecases/fetch_total_pages.dart';
import '../../domain/usecases/fetch_tv_show_genre_map.dart';
import '../../presentation/bloc/popular_tv/popular_tv_bloc.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  // Datasources
  getIt.registerLazySingleton<TmdbDatasource>(() => TmdbDatasource());

  // Repositories
  getIt.registerLazySingleton<TVShowRepository>(
    () => TVShowRepositoryImpl(getIt<TmdbDatasource>()),
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
      ));
}
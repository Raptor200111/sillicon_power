import '../../domain/entities/tv_show.dart';
import '../../domain/repositories/tv_show_repository.dart';
import '../datasources/tmdb_datasource.dart';

class TVShowRepositoryImpl implements TVShowRepository {
  final TmdbDatasource tmdbDatasource;

  const TVShowRepositoryImpl(this.tmdbDatasource);

  @override
  Future<List<TVShow>> fetchPopularTVShows(int page) async {
    final models = await tmdbDatasource.fetchPopularTvShows(page);
    return models.map((model) => model.toEntity()).toList();
  }

  @override
  Future<int> fetchTotalPages() => tmdbDatasource.fetchTotalPages();

  @override
  Future<Map<int, String>> fetchTvShowGenreMap() =>
      tmdbDatasource.fetchTvShowGenreMap();
}
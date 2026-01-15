import '../entities/tv_show.dart';

abstract class TVShowRepository {
  Future<List<TVShow>> fetchPopularTVShows(int page, String languageCode);
  Future<int> fetchTotalPages();
  Future<Map<int, String>> fetchTvShowGenreMap(String languageCode);
}
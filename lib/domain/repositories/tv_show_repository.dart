import '../entities/tv_show.dart';

abstract class TVShowRepository {
  Future<List<TVShow>> fetchPopularTVShows(int page);
  Future<int> fetchTotalPages();
}
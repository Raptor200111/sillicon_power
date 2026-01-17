import '../entities/tv_show.dart';
import '../repositories/tv_show_repository.dart';

class FetchPopularTVShows {
  final TVShowRepository repository;

  const FetchPopularTVShows(this.repository);

  Future<List<TVShow>> call(int page, String languageCode) => repository.fetchPopularTVShows(page, languageCode);
}
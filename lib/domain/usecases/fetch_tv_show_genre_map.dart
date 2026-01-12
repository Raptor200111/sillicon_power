import '../repositories/tv_show_repository.dart';

class FetchTvShowGenreMap {
  final TVShowRepository repository;

  const FetchTvShowGenreMap(this.repository);

  Future<Map<int, String>> call() => repository.fetchTvShowGenreMap();
}
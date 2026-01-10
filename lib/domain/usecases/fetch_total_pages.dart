import '../repositories/tv_show_repository.dart';

class FetchTotalPages {
  final TVShowRepository repository;

  const FetchTotalPages(this.repository);

  Future<int> call() => repository.fetchTotalPages();
}
import 'package:sillicon_power/data/datasources/offline_datasource.dart';
import 'package:sillicon_power/data/datasources/tmdb_datasource.dart';
import 'package:sillicon_power/data/models/tv_show_page_model.dart';
import 'package:sillicon_power/domain/entities/tv_show.dart';
import 'package:sillicon_power/domain/repositories/tv_show_repository.dart';

class TVShowRepositoryImpl implements TVShowRepository {
  final TmdbDatasource tmdbDatasource;
  final OfflineDatasource offlineDatasource;

  const TVShowRepositoryImpl(this.tmdbDatasource, this.offlineDatasource);

  @override
  Future<List<TVShow>> fetchPopularTVShows(int page, String languageCode) async {
    final models = await tmdbDatasource. fetchPopularTvShows(page, languageCode);
    return models.map((model) => model.toEntity()).toList();
  }

  @override
  Future<int> fetchTotalPages() => tmdbDatasource.fetchTotalPages();

  @override
  Future<Map<int, String>> fetchTvShowGenreMap(String languageCode) =>
      tmdbDatasource. fetchTvShowGenreMap(languageCode);

  /// Download all 500 pages for a language with progress callback
  @override
  Future<void> downloadAllPages(
    String language,
    Function(int, int) onProgress,
  ) async {
    const totalPages = 500;

    for (int page = 1; page <= totalPages; page++) {
      try {
        final tvShows = await fetchPopularTVShows(page, language);
        await cachePageData(page, language, tvShows);
        onProgress(page, totalPages);
      } catch (e) {
        // Continue downloading other pages on error
      }
    }
  }

  @override
  Future<List<TVShow>?> getCachedPageData(int page, String language) async {
    final pageData = await offlineDatasource.getPageData(page, language);
    if (pageData == null) return null;
    return pageData.tvShows. map((model) => model.toEntity()).toList();
  }

  @override
  Future<void> cachePageData(int page, String language, List<TVShow> tvShows) async {
    final models = tvShows
        .map((tvShow) => TVShowModel. fromEntity(tvShow))
        .toList();

    await offlineDatasource.savePageData(
      pageNumber: page,
      language: language,
      tvShows: models,
    );
  }

  @override
  Future<bool> areAllPagesDownloaded(String language) async {
    return await offlineDatasource.areAllPagesDownloaded(language);
  }

  @override
  Future<void> clearCache(int page, String language) async {
    await offlineDatasource. clearPageCache(page, language);
  }

  @override
  Future<void> clearAllCache() async {
    await offlineDatasource.clearAllCache();
  }
}
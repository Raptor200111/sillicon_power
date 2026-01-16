import 'package:sillicon_power/data/datasources/offline_datasource.dart';
import 'package:sillicon_power/data/datasources/tmdb_datasource.dart';
import 'package:sillicon_power/data/models/tv_show_page_model.dart';
import 'package:sillicon_power/domain/entities/tv_show.dart';
import 'package:sillicon_power/domain/repositories/tv_show_repository.dart';

class TVShowRepositoryImpl implements TVShowRepository {
  final TmdbDatasource tmdbDatasource;
  final OfflineDatasource offlineDatasource;

  const TVShowRepositoryImpl(
    this.tmdbDatasource,
    this. offlineDatasource,
  );

  @override
  Future<List<TVShow>> fetchPopularTVShows(int page, String language) async {
    final models = await tmdbDatasource. fetchPopularTvShows(page, language);
    final tvShows = models.map((model) => model.toEntity()).toList();
    
    // Automatically cache fresh data
    await cachePageData(page, language, tvShows);
    
    return tvShows;
  }

  /// Fetch and cache a page in BOTH languages simultaneously
  Future<List<TVShow>> fetchPageInBothLanguages(int page, String currentLanguage) async {
    try {
      // Fetch current language first (show to user immediately)
      final currentLangTvShows = await fetchPopularTVShows(page, currentLanguage);
      
      // Fetch other language in background
      final otherLang = currentLanguage == 'en' ? 'es' : 'en';
      _fetchAndCacheLanguageInBackground(page, otherLang);
      
      return currentLangTvShows;
    } catch (e) {
      rethrow;
    }
  }

  /// Background fetch for the other language
  // ignore:  unawaited_futures
  void _fetchAndCacheLanguageInBackground(int page, String language) async {
    try {
      await fetchPopularTVShows(page, language);
    } catch (e) {
      print('Background fetch for $language failed: $e');
    }
  }

  @override
  Future<List<TVShow>? > getCachedPageData(int page, String language) async {
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
      pageNumber:  page,
      language: language,
      tvShows: models,
    );
  }

  /// Get the maximum cached page for offline mode
  Future<int> getMaxCachedPages(String language) async {
    return await offlineDatasource.getMaxCachedPageNumber(language);
  }

  @override
  Future<void> clearCache(int page, String language) async {
    await offlineDatasource. clearPageCache(page, language);
  }

  @override
  Future<void> clearAllCache() async {
    await offlineDatasource.clearAllCache();
  }

  @override
  Future<int> fetchTotalPages() => tmdbDatasource.fetchTotalPages();

  @override
  Future<Map<int, String>> fetchTvShowGenreMap(String language) =>
      tmdbDatasource.fetchTvShowGenreMap(language);
}
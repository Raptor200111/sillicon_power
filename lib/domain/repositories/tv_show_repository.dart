import '../entities/tv_show.dart';

abstract class TVShowRepository {
  /// Fetch from API, optionally save to cache
  Future<List<TVShow>> fetchPopularTVShows(int page, String language);
  
  /// Fetch and cache a page in BOTH languages simultaneously
  Future<List<TVShow>> fetchPageInBothLanguages(int page, String currentLanguage);
  
  /// Get cached page data
  Future<List<TVShow>?> getCachedPageData(int page, String language);
  
  /// Save page data to cache
  Future<void> cachePageData(int page, String language, List<TVShow> tvShows);
  
  /// Get the maximum cached page number for offline mode
  Future<int> getMaxCachedPages(String language);
  
  /// Clear cache
  Future<void> clearCache(int page, String language);
  Future<void> clearAllCache();
  
  Future<int> fetchTotalPages();
  Future<Map<int, String>> fetchTvShowGenreMap(String language);
}
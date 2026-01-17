import '../entities/tv_show.dart';

abstract class TVShowRepository {
  Future<List<TVShow>> fetchPopularTVShows(int page, String languageCode);
  Future<int> fetchTotalPages();
  Future<Map<int, String>> fetchTvShowGenreMap(String languageCode);
  
  /// Download all 500 pages for a specific language
  Future<void> downloadAllPages(String language, Function(int, int) onProgress);
  
  /// Get cached page data
  Future<List<TVShow>?> getCachedPageData(int page, String language);
  
  /// Cache page data
  Future<void> cachePageData(int page, String language, List<TVShow> tvShows);
  
  /// Check if all pages are downloaded
  Future<bool> areAllPagesDownloaded(String language);
  
  /// Clear cache
  Future<void> clearCache(int page, String language);
  Future<void> clearAllCache();
}
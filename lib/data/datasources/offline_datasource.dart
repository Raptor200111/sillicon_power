import 'package:isar/isar.dart';
import '../models/tv_show_page_model.dart';

class OfflineDatasource {
  final Isar isar;

  const OfflineDatasource(this.isar);

  /// Save a complete page of TV shows with language
  Future<void> savePageData({
    required int pageNumber,
    required String language,
    required List<TVShowModel> tvShows,
  }) async {
    final pageData = TVShowPageModel(
      id: _generateId(pageNumber, language),
      pageNumber: pageNumber,
      language: language,
      tvShows: tvShows,
      cachedAt: DateTime.now(),
    );

    await isar.writeTxn(() async {
      await isar.tVShowPageModels.put(pageData);
    });
  }

  /// Get cached page data for specific language
  Future<TVShowPageModel?> getPageData(int pageNumber, String language) async {
    final id = _generateId(pageNumber, language);
    return await isar.tVShowPageModels. get(id);
  }

  /// Get all cached pages for a specific language
  Future<List<TVShowPageModel>> getAllPages(String language) async {
    return await isar.tVShowPageModels
        .where()
        .filter()
        .languageEqualTo(language)
        .findAll();
  }

  /// Count total cached pages for a specific language
  Future<int> getCachedPageCount(String language) async {
    final pages = await getAllPages(language);
    return pages.length;
  }

  /// Get the highest page number cached for a language
  Future<int> getMaxCachedPageNumber(String language) async {
    final pages = await getAllPages(language);
    if (pages.isEmpty) return 0;
    return pages.fold<int>(0, (max, page) => page.pageNumber > max ? page.pageNumber : max);
  }

  /// Clear specific page cache for a language
  Future<void> clearPageCache(int pageNumber, String language) async {
    final id = _generateId(pageNumber, language);
    await isar.writeTxn(() async {
      await isar.tVShowPageModels.delete(id);
    });
  }

  /// Clear all cached data
  Future<void> clearAllCache() async {
    await isar.writeTxn(() async {
      await isar.tVShowPageModels.clear();
    });
  }

  /// Check if page is cached and not too old
  bool isPageCacheValid(TVShowPageModel?    pageData, {Duration? maxAge}) {
    if (pageData == null) return false;
    if (maxAge == null) return true;
    return DateTime.now().difference(pageData.cachedAt) < maxAge;
  }

  /// Generate unique ID based on page number and language
  /// Example: page 1 + 'en' = 1000, page 1 + 'es' = 1001
  int _generateId(int pageNumber, String language) {
    final langCode = language == 'es' ? 1 : 0;
    return (pageNumber * 10) + langCode;
  }
}
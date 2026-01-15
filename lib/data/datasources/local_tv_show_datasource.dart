import 'package:isar/isar.dart';
import 'package:sillicon_power/core/di/services/isar_service.dart';
import '../models/local_tv_show_model.dart';

class LocalTvShowDatasource {
  final IsarService isarService;
  
  const LocalTvShowDatasource(this.isarService);
  
  Isar get _isar => isarService.isar;
  
  /// Save TV shows for a specific language and page
  Future<void> saveTVShowsForLanguage(
    List<LocalTVShowModel> tvShows,
    String language,
    int page,
  ) async {
    await _isar.writeTxn(() async {
      // Delete old data for this language and page
      final toDelete = await _isar. localTVShowModels
          .where()
          .filter()
          .languageEqualTo(language)
          .pageNumberEqualTo(page)
          .findAll();
      
      final idsToDelete = toDelete.map((e) => e.id!).toList();
      await _isar.localTVShowModels.deleteAll(idsToDelete);
      
      // Save the new data
      await _isar.localTVShowModels.putAll(tvShows);
    });
  }
  
  /// Get TV shows for a specific language and page
  Future<List<LocalTVShowModel>> getTVShowsForLanguage(
    String language,
    int page,
  ) async {
    final results = await _isar.localTVShowModels
        .where()
        .filter()
        .languageEqualTo(language)
        .pageNumberEqualTo(page)
        .findAll();
    
    return results;
  }
  
  /// Get all TV shows for a specific language (across all pages)
  Future<List<LocalTVShowModel>> getAllTVShowsForLanguage(
    String language,
  ) async {
    final results = await _isar.localTVShowModels
        .where()
        .filter()
        .languageEqualTo(language)
        .findAll();
    
    return results;
  }
  
  /// Get a single TV show by TMDB ID and language
  Future<LocalTVShowModel?> getTVShowByIdAndLanguage(
    int tmdbId,
    String language,
  ) async {
    final tmdbIdLanguageKey = '${tmdbId}_$language';
    
    final result = await _isar.localTVShowModels
        .where()
        .tmdbIdLanguageEqualTo(tmdbIdLanguageKey)
        .findFirst();
    
    return result;
  }
  
  /// Clear all TV shows for a specific language
  Future<void> clearTVShowsForLanguage(String language) async {
    await _isar.writeTxn(() async {
      final toDelete = await _isar.localTVShowModels
          .where()
          .filter()
          .languageEqualTo(language)
          .findAll();
      
      final idsToDelete = toDelete. map((e) => e.id!).toList();
      await _isar.localTVShowModels.deleteAll(idsToDelete);
    });
  }
  
  /// Clear all data from the database
  Future<void> clearAllData() async {
    await _isar.writeTxn(() async {
      await _isar.localTVShowModels.clear();
    });
  }
  
  /// Check if data exists for a language
  Future<bool> hasDataForLanguage(String language) async {
    final count = await _isar.localTVShowModels
        .where()
        .filter()
        .languageEqualTo(language)
        .count();
    
    return count > 0;
  }
  
  /// Check if specific page data exists for a language
  Future<bool> hasPageDataForLanguage(String language, int page) async {
    final count = await _isar.localTVShowModels
        .where()
        .filter()
        .languageEqualTo(language)
        .pageNumberEqualTo(page)
        .count();
    
    return count > 0;
  }
  
  /// Get cached data age (how old is the oldest cache entry for this language)
  Future<DateTime?> getCacheAgeForLanguage(String language) async {
    final oldestEntry = await _isar.localTVShowModels
        .where()
        .filter()
        .languageEqualTo(language)
        .sortByCachedAt()
        .findFirst();
    
    return oldestEntry?.cachedAt;
  }
  
  /// Delete cached data older than specified duration
  Future<void> clearOldCachedData({
    Duration cacheValidDuration = const Duration(days: 1),
  }) async {
    final cutoffTime = DateTime.now().subtract(cacheValidDuration);
    
    await _isar.writeTxn(() async {
      final toDelete = await _isar.localTVShowModels
          .where()
          .filter()
          .cachedAtLessThan(cutoffTime)
          .findAll();
      
      final idsToDelete = toDelete. map((e) => e.id!).toList();
      await _isar.localTVShowModels.deleteAll(idsToDelete);
    });
  }
  
  /// Get the total count of cached items
  Future<int> getTotalCachedCount() async {
    return await _isar.localTVShowModels.count();
  }
}
import 'package:sillicon_power/data/datasources/local_tv_show_datasource.dart';
import '../../domain/entities/tv_show.dart';
import '../../domain/repositories/tv_show_repository.dart';
import '../datasources/tmdb_datasource.dart';
import '../models/local_tv_show_model.dart';

class TVShowRepositoryImpl implements TVShowRepository {
  final TmdbTvShowDatasource tmdbDatasource;
  final LocalTvShowDatasource localDatasource;

  const TVShowRepositoryImpl(
    this.tmdbDatasource,
    this.localDatasource,
  );

  /// Get the current language (you'll need to implement language provider)
  /// For now, we'll default to 'en'.  Later you'll connect this to your language provider
  String get _currentLanguage => 'en';

  @override
  Future<List<TVShow>> fetchPopularTVShows(int page, String language) async {
    try {
      // Try to fetch from API first
      final models = await tmdbDatasource. fetchPopularTvShows(page, language);
      
      // Convert to local models and save to database
      final localModels = models
          .map((model) => LocalTVShowModel.fromTmdbModel(
                model,
                language: _currentLanguage,
                pageNumber: page,
              ))
          .toList();
      
      // Save to local database for offline access
      await localDatasource. saveTVShowsForLanguage(
        localModels,
        _currentLanguage,
        page,
      );
      
      // Return the data (converted to entities)
      return localModels. map((model) => model.toEntity()).toList();
    } catch (e) {
      // If API fails, try to get from local database
      final localModels = await localDatasource.getTVShowsForLanguage(
        _currentLanguage,
        page,
      );
      
      if (localModels.isNotEmpty) {
        // Return cached data
        return localModels.map((model) => model.toEntity()).toList();
      }
      
      // No local data available, re-throw the error
      rethrow;
    }
  }

  @override
  Future<int> fetchTotalPages() async {
    try {
      return await tmdbDatasource.fetchTotalPages();
    } catch (e) {
      // If API fails, return a default value
      // In a real app, you might cache this too
      return 1;
    }
  }

  @override
  Future<Map<int, String>> fetchTvShowGenreMap(String language) async {
    try {
      return await tmdbDatasource.fetchTvShowGenreMap(language);
    } catch (e) {
      // If API fails, return empty map
      // In a real app, you might cache this too
      return {};
    }
  }
  
  /// Clear all cached data for current language
  Future<void> clearCacheForCurrentLanguage() async {
    await localDatasource.clearTVShowsForLanguage(_currentLanguage);
  }
  
  /// Clear all cached data
  Future<void> clearAllCache() async {
    await localDatasource.clearAllData();
  }
  
  /// Check if we have cached data for the current page
  Future<bool> hasCachedPage(int page) async {
    return await localDatasource.hasPageDataForLanguage(_currentLanguage, page);
  }
  
  /// Check if we have any cached data for current language
  Future<bool> hasCachedData() async {
    return await localDatasource.hasDataForLanguage(_currentLanguage);
  }
}
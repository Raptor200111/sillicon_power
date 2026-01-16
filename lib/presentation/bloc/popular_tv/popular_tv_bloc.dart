import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sillicon_power/domain/repositories/tv_show_repository.dart';
import 'package:sillicon_power/domain/usecases/fetch_popular_tv_shows.dart';
import 'package:sillicon_power/domain/usecases/fetch_total_pages.dart';
import 'package:sillicon_power/domain/usecases/fetch_tv_show_genre_map.dart';
import 'popular_tv_event.dart';
import 'popular_tv_state.dart';

class PopularTVBloc extends Bloc<PopularTVEvent, PopularTVState> {
  final FetchPopularTVShows fetchPopularTVShows;
  final FetchTotalPages fetchTotalPages;
  final FetchTvShowGenreMap fetchTvShowGenreMap;
  final TVShowRepository repository;

  PopularTVBloc({
    required this.fetchPopularTVShows,
    required this.fetchTotalPages,
    required this.fetchTvShowGenreMap,
    required this.repository,
  }) : super(PopularTVInitial()) {
    on<LoadPopularTVShows>(_onLoadPopularTVShows);
    on<LoadPopularTVShowsWithCache>(_onLoadPopularTVShowsWithCache);
    on<RefreshPageData>(_onRefreshPageData);
    on<LoadTvShowInfo>(_onLoadTvShowInfo);
  }

  /// Original method - direct fetch
  Future<void> _onLoadPopularTVShows(
    LoadPopularTVShows event,
    Emitter<PopularTVState> emit,
  ) async {
    emit(PopularTVLoading());
    try {
      final tvShows = await fetchPopularTVShows(event.page, event.language);
      final totalPages = state is PopularTVLoaded
          ? (state as PopularTVLoaded).totalPages
          : await fetchTotalPages();
      final genreMap = state is PopularTVLoaded
          ? (state as PopularTVLoaded).genreMap
          : await fetchTvShowGenreMap(event.language);
      
      emit(PopularTVLoaded(tvShows, totalPages, genreMap));
    } catch (e) {
      emit(PopularTVError(e.toString()));
    }
  }

  /// Smart offline-first loading with BOTH languages cached
  Future<void> _onLoadPopularTVShowsWithCache(
    LoadPopularTVShowsWithCache event,
    Emitter<PopularTVState> emit,
  ) async {
    // Try to get cached data first
    final cachedTvShows = await repository.  getCachedPageData(event.page, event.language);
    final totalPages = state is PopularTVLoadedFromCache
        ? (state as PopularTVLoadedFromCache).totalPages
        : (state is PopularTVLoaded
            ? (state as PopularTVLoaded).totalPages
            : null);
    final genreMap = state is PopularTVLoadedFromCache
        ? (state as PopularTVLoadedFromCache).genreMap
        : (state is PopularTVLoaded
            ? (state as PopularTVLoaded).genreMap
            : null);

    // If we have cached data, show it immediately
    if (cachedTvShows != null && totalPages != null && genreMap != null) {
      emit(PopularTVLoadedFromCache(
        cachedTvShows,
        totalPages,
        genreMap,
        isRefreshing: true,
      ));

      // Fetch fresh data in BOTH languages in background
      _fetchFreshDataInBothLanguages(event.page, event.language);
    } else if (cachedTvShows != null) {
      // Have cached data but missing metadata
      emit(PopularTVLoadedFromCache(
        cachedTvShows,
        totalPages ??  0,
        genreMap ??  {},
        isRefreshing:  true,
      ));

      try {
        final newTotalPages = await fetchTotalPages();
        final newGenreMap = await fetchTvShowGenreMap(event.language);

        emit(PopularTVLoadedFromCache(
          cachedTvShows,
          newTotalPages,
          newGenreMap,
          isRefreshing: false,
        ));
      } catch (e) {
        // Keep cached data even if metadata fetch fails - likely offline
        // Try to get max cached pages for offline mode
        final maxCachedPages = await repository.getMaxCachedPages(event.language);
        if (maxCachedPages > 0) {
          emit(PopularTVLoadedFromCache(
            cachedTvShows,
            maxCachedPages,
            genreMap ?? {},
            isRefreshing: false,
          ));
        }
      }
    } else {
      // No cached data, load normally (fetch in both languages)
      emit(PopularTVLoading());
      try {
        final tvShows = await repository.fetchPageInBothLanguages(event.  page, event.language);
        final newTotalPages = state is PopularTVLoaded
            ? (state as PopularTVLoaded).totalPages
            :   await fetchTotalPages();
        final newGenreMap = state is PopularTVLoaded
            ? (state as PopularTVLoaded).genreMap
            : await fetchTvShowGenreMap(event.language);
        
        emit(PopularTVLoaded(tvShows, newTotalPages, newGenreMap));
      } catch (e) {
        // Network error with no cached data - try to show ANY cached state we have
        final lastKnownTotalPages = (state is PopularTVLoaded) 
            ? (state as PopularTVLoaded).totalPages 
            : null;
        final lastKnownGenreMap = (state is PopularTVLoaded)
            ? (state as PopularTVLoaded).genreMap
            : null;
        
        // If we have previous state, use it as fallback
        if (lastKnownTotalPages != null && lastKnownGenreMap != null) {
          // Get max cached pages instead of using full totalPages
          final maxCachedPages = await repository.getMaxCachedPages(event.language);
          emit(PopularTVLoadedFromCache(
            const [],
            maxCachedPages > 0 ? maxCachedPages : lastKnownTotalPages,
            lastKnownGenreMap,
            isRefreshing:  false,
          ));
        } else {
          // Only show error if truly no cached data anywhere
          emit(PopularTVError(e.toString()));
        }
      }
    }
  }

  /// Fetch fresh data in both languages
  // ignore: unawaited_futures
  void _fetchFreshDataInBothLanguages(int page, String language) async {
    try {
      final freshTvShows = await repository. fetchPageInBothLanguages(page, language);
      
      // Only emit if still in cache state
      if (state is PopularTVLoadedFromCache) {
        final currentState = state as PopularTVLoadedFromCache;
        // ignore: invalid_use_of_visible_for_testing_member
        emit(PopularTVLoadedFromCache(
          freshTvShows,
          currentState.totalPages,
          currentState.genreMap,
          isRefreshing: false,
        ));
      }
    } catch (e) {
      // If fetch fails, just stop the refreshing indicator - keep showing cached data
      // Update totalPages to reflect only cached pages when offline
      if (state is PopularTVLoadedFromCache) {
        final currentState = state as PopularTVLoadedFromCache;
        final maxCachedPages = await repository. getMaxCachedPages(language);
        // ignore:   invalid_use_of_visible_for_testing_member
        emit(PopularTVLoadedFromCache(
          currentState.tvShows,
          maxCachedPages > 0 ? maxCachedPages : currentState.totalPages,
          currentState.genreMap,
          isRefreshing:  false,
        ));
      }
    }
  }

  Future<void> _onRefreshPageData(
    RefreshPageData event,
    Emitter<PopularTVState> emit,
  ) async {
    if (state is PopularTVLoadedFromCache) {
      final currentState = state as PopularTVLoadedFromCache;
      emit(currentState.copyWith(isRefreshing: true));
      _fetchFreshDataInBothLanguages(event.page, event. language);
    }
  }

  Future<void> _onLoadTvShowInfo(
    LoadTvShowInfo event,
    Emitter<PopularTVState> emit,
  ) async {
    emit(PopularTVLoading());
    try {
      final totalPages = await fetchTotalPages();
      final genreMap = await fetchTvShowGenreMap(event.language);
      emit(PopularTVLoaded(const [], totalPages, genreMap));
    } catch (e) {
      // If fetching info fails, try to use previous state
      if (state is PopularTVLoaded) {
        // Keep previous state
        return;
      }
      emit(PopularTVError(e.  toString()));
    }
  }
}
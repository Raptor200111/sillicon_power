import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sillicon_power/domain/repositories/tv_show_repository.dart';
import 'package:sillicon_power/domain/usecases/fetch_tv_show_genre_map.dart';
import '../../../domain/usecases/fetch_popular_tv_shows.dart';
import '../../../domain/usecases/fetch_total_pages.dart';
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
    on<LoadTvShowInfo>(_onLoadTvShowInfo);
    on<DownloadAllPages>(_onDownloadAllPages);
    on<LoadPageWithBackground>(_onLoadPageWithBackground);
  }

  /// Download all 500 pages for a language
  Future<void> _onDownloadAllPages(
    DownloadAllPages event,
    Emitter<PopularTVState> emit,
  ) async {
    try {
      // First, load initial data (page 1 + metadata) to show immediately
      await _loadInitialData(emit);

      // Then download the rest in background (pages 2-500)
      _downloadRemainingPagesInBackground();
    } catch (e) {
      if (!emit.isDone) {
        emit(PopularTVError('Failed to load initial data: ${e.toString()}'));
      }
    }
  }

  /// Load initial data (page 1 + metadata)
  Future<void> _loadInitialData(Emitter<PopularTVState> emit) async {
    try {
      final totalPages = await fetchTotalPages();
      final genreMap = await fetchTvShowGenreMap('en');
      final tvShows = await fetchPopularTVShows(1, 'en');
      
      // Cache page 1
      await repository.cachePageData(1, 'en', tvShows);

      if (!emit.isDone) {
        emit(PopularTVLoaded(tvShows, totalPages, genreMap));
      }
    } catch (e) {
      if (!emit.isDone) {
        emit(PopularTVError('Failed to load initial data: ${e.toString()}'));
      }
    }
  }

  /// Download remaining pages in background (pages 2-500 for both languages)
  void _downloadRemainingPagesInBackground() {
    // Fire and forget - don't await
    _downloadPagesAsync();
  }

  /// Async method to download pages in background
  Future<void> _downloadPagesAsync() async {
    try {
      // Download pages 2-500 for English
      for (int page = 2; page <= 500; page++) {
        try {
          final tvShows = await fetchPopularTVShows(page, 'en');
          await repository. cachePageData(page, 'en', tvShows);
        } catch (e) {
          // Continue downloading even if one page fails
        }
      }

      // Then download pages 1-500 for Spanish
      for (int page = 1; page <= 500; page++) {
        try {
          final tvShows = await fetchPopularTVShows(page, 'es');
          await repository.cachePageData(page, 'es', tvShows);
        } catch (e) {
          // Continue downloading even if one page fails
        }
      }
    } catch (e) {
      // Silent fail for background download
    }
  }

  /// Load a page and update in background if online
  Future<void> _onLoadPageWithBackground(
    LoadPageWithBackground event,
    Emitter<PopularTVState> emit,
  ) async {
    // Get current state
    if (state is!   PopularTVLoaded) return;

    final currentState = state as PopularTVLoaded;

    // Try to get cached data first
    final cachedTvShows = await repository.getCachedPageData(event.page, 'en');

    if (cachedTvShows != null) {
      // Show cached data immediately
      if (!emit.isDone) {
        emit(currentState.copyWith(tvShows: cachedTvShows, isRefreshing: true));
      }

      // Try to refresh in background
      await _refreshPageInBackground(event. page, emit, currentState);
    } else {
      // No cached data, show loading
      if (!emit.isDone) {
        emit(currentState.copyWith(isRefreshing: true));
      }

      try {
        final tvShows = await fetchPopularTVShows(event.page, 'en');
        await repository. cachePageData(event.page, 'en', tvShows);

        if (!emit.isDone) {
          emit(currentState.copyWith(tvShows: tvShows, isRefreshing: false));
        }
      } catch (e) {
        // Failed to load - keep previous state
        if (!emit.isDone) {
          emit(currentState.copyWith(isRefreshing:   false));
        }
      }
    }
  }

  /// Refresh page in background without blocking UI
  Future<void> _refreshPageInBackground(
    int page,
    Emitter<PopularTVState> emit,
    PopularTVLoaded currentState,
  ) async {
    try {
      final freshTvShows = await fetchPopularTVShows(page, 'en');
      await repository.cachePageData(page, 'en', freshTvShows);

      if (state is PopularTVLoaded && !emit. isDone) {
        final latestState = state as PopularTVLoaded;
        emit(latestState.copyWith(tvShows: freshTvShows, isRefreshing: false));
      }
    } catch (e) {
      // Network error - keep showing cached data
      if (state is PopularTVLoaded && !emit.isDone) {
        final latestState = state as PopularTVLoaded;
        emit(latestState.copyWith(isRefreshing: false));
      }
    }
  }

  /// Load TV show metadata (genres and total pages)
  Future<void> _onLoadTvShowInfo(
    LoadTvShowInfo event,
    Emitter<PopularTVState> emit,
  ) async {
    emit(PopularTVLoading());
    try {
      final totalPages = await fetchTotalPages();
      final genreMap = await fetchTvShowGenreMap('en');

      // Try to get cached page 1
      final cachedPage1 = await repository.getCachedPageData(1, 'en');
      final tvShows = cachedPage1 ?? [];

      if (!emit.isDone) {
        emit(PopularTVLoaded(tvShows, totalPages, genreMap));
      }
    } catch (e) {
      if (!emit.isDone) {
        emit(PopularTVError(e.toString()));
      }
    }
  }
}
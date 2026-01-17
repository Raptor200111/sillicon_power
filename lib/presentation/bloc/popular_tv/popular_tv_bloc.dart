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
    on<LoadPopularTVShows>(_onLoadPopularTVShows);
    on<LoadTvShowInfo>(_onLoadTvShowInfo);
    on<DownloadAllPages>(_onDownloadAllPages);
  }

  Future<void> _onLoadPopularTVShows(
    LoadPopularTVShows event,
    Emitter<PopularTVState> emit,
  ) async {
    try {
      // Try to get cached data first
      final cachedTvShows = await repository.getCachedPageData(event.page, event.language);

      if (cachedTvShows != null) {
        // Show cached data immediately
        final totalPages = state is PopularTVLoaded
            ? (state as PopularTVLoaded).totalPages
            : await fetchTotalPages();
        final genreMap = state is PopularTVLoaded
            ? (state as PopularTVLoaded).genreMap
            : await fetchTvShowGenreMap(event.language);

        if (! emit.isDone) {
          emit(PopularTVLoaded(cachedTvShows, totalPages, genreMap));
        }
        
        // Refresh in background silently (don't change UI)
        _refreshPageInBackground(event.page, event.language);
      } else {
        // No cached data, fetch it
        emit(PopularTVLoading());

        final tvShows = await fetchPopularTVShows(event. page, event.language);
        
        // Cache the data
        await repository. cachePageData(event.page, event.language, tvShows);

        // Get totalPages and genreMap
        final totalPages = await fetchTotalPages();
        final genreMap = await fetchTvShowGenreMap(event.language);

        if (!emit.isDone) {
          emit(PopularTVLoaded(tvShows, totalPages, genreMap));
        }
      }
    } catch (e) {
      if (! emit.isDone) {
        emit(PopularTVError(e.toString()));
      }
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
      
      // Try to load cached page 1
      final cachedPage1 = await repository.getCachedPageData(1, event.language);
      
      if (!emit. isDone) {
        emit(PopularTVLoaded(cachedPage1 ??  [], totalPages, genreMap));
      }
    } catch (e) {
      if (!emit.isDone) {
        emit(PopularTVError(e.toString()));
      }
    }
  }

  Future<void> _onDownloadAllPages(
    DownloadAllPages event,
    Emitter<PopularTVState> emit,
  ) async {
    // Download pages in background only
    _downloadPagesInBackground();
  }

  /// Download all pages in background
  void _downloadPagesInBackground() {
    Future(() async {
      try {
        // Download pages 1-500 for English
        for (int page = 1; page <= 500; page++) {
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
    });
  }

  /// Refresh page in background without blocking UI
  void _refreshPageInBackground(
    int page,
    String language,
  ) {
    Future(() async {
      try {
        final freshTvShows = await fetchPopularTVShows(page, language);
        await repository.cachePageData(page, language, freshTvShows);
        // Don't emit anything - just silently update cache
      } catch (e) {
        // Silent fail
      }
    });
  }
}
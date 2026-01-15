import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sillicon_power/domain/usecases/fetch_tv_show_genre_map.dart';
import '../../../domain/usecases/fetch_popular_tv_shows.dart';
import '../../../domain/usecases/fetch_total_pages.dart';
import 'popular_tv_event.dart';
import 'popular_tv_state.dart';

class PopularTVBloc extends Bloc<PopularTVEvent, PopularTVState> {
  final FetchPopularTVShows fetchPopularTVShows;
  final FetchTotalPages fetchTotalPages;
  final FetchTvShowGenreMap fetchTvShowGenreMap;

  PopularTVBloc({
    required this.fetchPopularTVShows,
    required this.fetchTotalPages,
    required this.fetchTvShowGenreMap,
  }) : super(PopularTVInitial()) {
    on<LoadPopularTVShows>(_onLoadPopularTVShows);
    on<LoadTvShowInfo>(_onLoadTvShowInfo);
  }

  Future<void> _onLoadPopularTVShows(
    LoadPopularTVShows event,
    Emitter<PopularTVState> emit,
  ) async {
    emit(PopularTVLoading());
    try {
      final tvShows = await fetchPopularTVShows(event.page, event.languageCode);
      // Assume totalPages is already loaded; in a real app, cache it
      final totalPages = state is PopularTVLoaded
          ? (state as PopularTVLoaded).totalPages
          : await fetchTotalPages();
      final genreMap = state is PopularTVLoaded
          ? (state as PopularTVLoaded).genreMap
          : await fetchTvShowGenreMap(event.languageCode);
      emit(PopularTVLoaded(tvShows, totalPages, genreMap)); // Empty genreMap for now
    } catch (e) {
      emit(PopularTVError(e.toString()));
    }
  }

  Future<void> _onLoadTvShowInfo(
    LoadTvShowInfo event,
    Emitter<PopularTVState> emit,
  ) async {
    emit(PopularTVLoading());
    try {
      final totalPages = await fetchTotalPages();
      final genreMap = await fetchTvShowGenreMap(event.languageCode); // You need to implement this use case
      emit(PopularTVLoaded([], totalPages, genreMap)); // Empty list initially
    } catch (e) {
      emit(PopularTVError(e.toString()));
    }
  }
}
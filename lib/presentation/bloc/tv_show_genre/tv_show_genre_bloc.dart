import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sillicon_power/domain/usecases/fetch_tv_show_genre_map.dart';
import 'tv_show_genre_event.dart';
import 'tv_show_genre_state.dart';

class TvShowGenreBloc extends Bloc<TvShowGenreEvent, TvShowGenreState> {
  final FetchTvShowGenreMap fetchTvShowGenreMap;

  TvShowGenreBloc({
    required this.fetchTvShowGenreMap,
  }) : super(TvShowGenreInitial()) {
    on<LoadTvShowGenre>(_onLoadTvShowGenre);
  }

  Future<void> _onLoadTvShowGenre(
    LoadTvShowGenre event,
    Emitter<TvShowGenreState> emit,
  ) async {
    emit(TvShowGenreLoading());
    try {
      final genres = await fetchTvShowGenreMap();

      emit(TvShowGenreLoaded(genres));
    } catch (e) {
      emit(TvShowGenreError(e.toString()));
    }
  }
}
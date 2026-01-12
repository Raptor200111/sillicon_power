import 'package:equatable/equatable.dart';

abstract class TvShowGenreEvent extends Equatable {
  const TvShowGenreEvent();

  @override
  List<Object> get props => [];
}

class LoadTvShowGenre extends TvShowGenreEvent {

  const LoadTvShowGenre();

  @override
  List<Object> get props => [];
}

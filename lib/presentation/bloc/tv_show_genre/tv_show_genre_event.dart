import 'package:equatable/equatable.dart';

abstract class TvShowGenreEvent extends Equatable {
  const TvShowGenreEvent();

  @override
  List<Object> get props => [];
}

class LoadTvShowGenre extends TvShowGenreEvent {
  final int page;

  const LoadTvShowGenre(this.page);

  @override
  List<Object> get props => [page];
}

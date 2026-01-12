import 'package:equatable/equatable.dart';

abstract class TvShowGenreState extends Equatable {
  const TvShowGenreState();

  @override
  List<Object> get props => [];
}

class TvShowGenreInitial extends TvShowGenreState {}

class TvShowGenreLoading extends TvShowGenreState {}

class TvShowGenreLoaded extends TvShowGenreState {
  final Map<int, String> genres;

  const TvShowGenreLoaded(this.genres);

  @override
  List<Object> get props => [genres];
}

class TvShowGenreError extends TvShowGenreState {
  final String message;

  const TvShowGenreError(this.message);

  @override
  List<Object> get props => [message];
}
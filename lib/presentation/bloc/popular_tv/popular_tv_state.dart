import 'package:equatable/equatable.dart';
import '../../../domain/entities/tv_show.dart';

abstract class PopularTVState extends Equatable {
  const PopularTVState();

  @override
  List<Object> get props => [];
}

class PopularTVInitial extends PopularTVState {}

class PopularTVLoading extends PopularTVState {}

class PopularTVLoaded extends PopularTVState {
  final List<TVShow> tvShows;
  final int totalPages;
  final Map<int, String> genreMap;

  const PopularTVLoaded(this.tvShows, this.totalPages, this.genreMap);

  @override
  List<Object> get props => [tvShows, totalPages, genreMap];
}

class PopularTVError extends PopularTVState {
  final String message;

  const PopularTVError(this.message);

  @override
  List<Object> get props => [message];
}
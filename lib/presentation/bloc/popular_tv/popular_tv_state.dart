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

  const PopularTVLoaded(this.tvShows, this.totalPages);

  @override
  List<Object> get props => [tvShows, totalPages];
}

class PopularTVError extends PopularTVState {
  final String message;

  const PopularTVError(this.message);

  @override
  List<Object> get props => [message];
}
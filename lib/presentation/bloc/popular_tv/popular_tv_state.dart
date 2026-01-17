import 'package:equatable/equatable.dart';
import '../../../domain/entities/tv_show.dart';

abstract class PopularTVState extends Equatable {
  const PopularTVState();

  @override
  List<Object> get props => [];
}

class PopularTVInitial extends PopularTVState {}

class DownloadingPages extends PopularTVState {
  final int downloadedPages;
  final int totalPages;

  const DownloadingPages(this.downloadedPages, this.totalPages);

  @override
  List<Object> get props => [downloadedPages, totalPages];
}

class PopularTVLoading extends PopularTVState {}

class PopularTVLoaded extends PopularTVState {
  final List<TVShow> tvShows;
  final int totalPages;
  final Map<int, String> genreMap;
  final bool isRefreshing;

  const PopularTVLoaded(
    this.tvShows,
    this.totalPages,
    this.genreMap, {
    this.isRefreshing = false,
  });

  PopularTVLoaded copyWith({
    List<TVShow>? tvShows,
    int? totalPages,
    Map<int, String>? genreMap,
    bool? isRefreshing,
  }) {
    return PopularTVLoaded(
      tvShows ?? this.tvShows,
      totalPages ?? this.totalPages,
      genreMap ?? this.genreMap,
      isRefreshing:  isRefreshing ?? this.isRefreshing,
    );
  }

  @override
  List<Object> get props => [tvShows, totalPages, genreMap, isRefreshing];
}

class PopularTVError extends PopularTVState {
  final String message;

  const PopularTVError(this.message);

  @override
  List<Object> get props => [message];
}
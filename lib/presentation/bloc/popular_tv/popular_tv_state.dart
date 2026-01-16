import 'package:equatable/equatable.dart';
import '../../../domain/entities/tv_show.dart';

abstract class PopularTVState extends Equatable {
  const PopularTVState();

  @override
  List<Object> get props => [];
}

class PopularTVInitial extends PopularTVState {}

class PopularTVLoading extends PopularTVState {}

/// NEW: Shows cached data while fetching fresh data
class PopularTVLoadedFromCache extends PopularTVState {
  final List<TVShow> tvShows;
  final int totalPages;
  final Map<int, String> genreMap;
  final bool isRefreshing; // Indicates if background fetch is happening

  const PopularTVLoadedFromCache(
    this.tvShows,
    this.totalPages,
    this.genreMap, 
    {
      this.isRefreshing = false,
    }
  );

  @override
  List<Object> get props => [tvShows, totalPages, genreMap, isRefreshing];

  /// Create copy with different values
  PopularTVLoadedFromCache copyWith({
    List<TVShow>? tvShows,
    int? totalPages,
    Map<int, String>? genreMap,
    bool? isRefreshing,
  }) {
    return PopularTVLoadedFromCache(
      tvShows ?? this.tvShows,
      totalPages ?? this.totalPages,
      genreMap ?? this.genreMap,
      isRefreshing:  isRefreshing ?? this.isRefreshing,
    );
  }
}

class PopularTVLoaded extends PopularTVState {
  final List<TVShow> tvShows;
  final int totalPages;
  final Map<int, String> genreMap;

  const PopularTVLoaded(this.tvShows, this. totalPages, this.genreMap);

  @override
  List<Object> get props => [tvShows, totalPages, genreMap];
}

class PopularTVError extends PopularTVState {
  final String message;
  final List<TVShow>? cachedTvShows;
  final int? totalPages;
  final Map<int, String>? genreMap;

  const PopularTVError(
    this.message, {
    this.cachedTvShows,
    this.totalPages,
    this.genreMap,
  });

  @override
  List<Object> get props => [
    message,
    if (cachedTvShows != null) cachedTvShows!,
    if (totalPages != null) totalPages!,
    if (genreMap != null) genreMap!,
  ];
}
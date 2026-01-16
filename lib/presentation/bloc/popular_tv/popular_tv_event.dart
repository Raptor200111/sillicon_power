import 'package:equatable/equatable.dart';

abstract class PopularTVEvent extends Equatable {
  const PopularTVEvent();

  @override
  List<Object> get props => [];
}

class LoadPopularTVShows extends PopularTVEvent {
  final int page;
  final String language;

  const LoadPopularTVShows(this.page, this.language);

  @override
  List<Object> get props => [page, language];
}

class LoadTvShowInfo extends PopularTVEvent {
  final String language;
  const LoadTvShowInfo(this.language);
}

/// NEW: Load page with cached data first, then refresh
class LoadPopularTVShowsWithCache extends PopularTVEvent {
  final int page;
  final String language; 

  const LoadPopularTVShowsWithCache(this.page, this.language);

  @override
  List<Object> get props => [page, language];
}

/// NEW:  Refresh existing data in background
class RefreshPageData extends PopularTVEvent {
  final int page;
  final String language;

  const RefreshPageData(this. page, this.language);

  @override
  List<Object> get props => [page, language];
}
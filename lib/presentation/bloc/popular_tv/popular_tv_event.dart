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
  
  @override
  List<Object> get props => [language];
}

class DownloadAllPages extends PopularTVEvent {
  const DownloadAllPages();
}
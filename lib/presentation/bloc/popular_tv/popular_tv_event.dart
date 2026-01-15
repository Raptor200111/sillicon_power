import 'package:equatable/equatable.dart';

abstract class PopularTVEvent extends Equatable {
  const PopularTVEvent();

  @override
  List<Object> get props => [];
}

class LoadPopularTVShows extends PopularTVEvent {
  final int page;
  final String languageCode;

  const LoadPopularTVShows(this.page, this.languageCode);

  @override
  List<Object> get props => [page, languageCode];
}

class LoadTvShowInfo extends PopularTVEvent {
  final String languageCode;
  const LoadTvShowInfo(this.languageCode);
}
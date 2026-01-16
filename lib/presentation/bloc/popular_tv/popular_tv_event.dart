import 'package:equatable/equatable.dart';

abstract class PopularTVEvent extends Equatable {
  const PopularTVEvent();

  @override
  List<Object> get props => [];
}

class LoadTvShowInfo extends PopularTVEvent {
  const LoadTvShowInfo();
}

class DownloadAllPages extends PopularTVEvent {
  const DownloadAllPages();
}

class LoadPageWithBackground extends PopularTVEvent {
  final int page;

  const LoadPageWithBackground(this.page);

  @override
  List<Object> get props => [page];
}
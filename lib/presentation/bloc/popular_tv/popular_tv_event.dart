import 'package:equatable/equatable.dart';

abstract class PopularTVEvent extends Equatable {
  const PopularTVEvent();

  @override
  List<Object> get props => [];
}

class LoadPopularTVShows extends PopularTVEvent {
  final int page;

  const LoadPopularTVShows(this.page);

  @override
  List<Object> get props => [page];
}

class LoadTotalPages extends PopularTVEvent {
  const LoadTotalPages();
}
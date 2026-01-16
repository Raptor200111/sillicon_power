import 'package:isar/isar.dart';
import '../../domain/entities/tv_show.dart';

part 'tv_show_page_model.g.dart';

/// Wrapper model that stores a complete page of TV shows with metadata
@collection
class TVShowPageModel {
  Id?   id;
  late int pageNumber;
  late String language;
  late List<TVShowModel> tvShows;
  late DateTime cachedAt;
  
  TVShowPageModel({
    this.id,
    required this.pageNumber,
    required this.language,
    required this.tvShows,
    required this.cachedAt,
  });
}

/// Individual TV show model for Isar - EMBEDDED objects can't have required params
@embedded
class TVShowModel {
  late int id;
  late String name;
  late String overview;
  late String posterPath;
  late String backdropPath;
  late String firstAirDate;
  late double voteAverage;
  late int voteCount;
  late double popularity;
  late List<int> genreIds;
  late List<String> originCountry;
  late String originalLanguage;
  late String originalName;

  TVShowModel() {
    // Default constructor for Isar
  }

  TVShowModel.create({
    required this.id,
    required this.name,
    required this.overview,
    required this.posterPath,
    required this.backdropPath,
    required this.firstAirDate,
    required this.voteAverage,
    required this. voteCount,
    required this.popularity,
    required this. genreIds,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalName,
  });

  /// Convert domain entity to Isar model
  factory TVShowModel.fromEntity(TVShow tvShow) {
    return TVShowModel. create(
      id: tvShow.id,
      name: tvShow.name,
      overview: tvShow.overview,
      posterPath: tvShow.posterPath,
      backdropPath: tvShow.backdropPath,
      firstAirDate: tvShow.firstAirDate,
      voteAverage: tvShow.voteAverage,
      voteCount: tvShow.voteCount,
      popularity: tvShow.popularity,
      genreIds: tvShow.genreIds,
      originCountry: tvShow.originCountry,
      originalLanguage: tvShow.originalLanguage,
      originalName: tvShow. originalName,
    );
  }

  /// Convert Isar model to domain entity
  TVShow toEntity() {
    return TVShow(
      id: id,
      name:  name,
      overview: overview,
      posterPath: posterPath,
      backdropPath: backdropPath,
      firstAirDate: firstAirDate,
      voteAverage: voteAverage,
      voteCount:  voteCount,
      popularity:  popularity,
      genreIds:  genreIds,
      originCountry: originCountry,
      originalLanguage: originalLanguage,
      originalName: originalName,
    );
  }
}
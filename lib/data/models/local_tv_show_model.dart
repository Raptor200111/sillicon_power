import 'package:isar/isar.dart';
import '../../domain/entities/tv_show.dart';
import 'tmdb_tv_show_model.dart';

part 'local_tv_show_model.g.dart';

@collection
class LocalTVShowModel {
  Id? id;
  
  // Original TV Show fields
  final int tmdbId;
  final String name;
  final String overview;
  final String posterPath;
  final String backdropPath;
  final String firstAirDate;
  final double voteAverage;
  final int voteCount;
  final double popularity;
  final List<int> genreIds;
  final List<String> originCountry;
  final String originalLanguage;
  final String originalName;
  
  // Offline/Cache specific fields
  final String language;  // Index this
  final int pageNumber;   // Index this
  final DateTime cachedAt;
  
  @Index()
  final String tmdbIdLanguage;
  
  LocalTVShowModel({
    this.id,
    required this. tmdbId,
    required this.name,
    required this. overview,
    required this.posterPath,
    required this.backdropPath,
    required this. firstAirDate,
    required this.voteAverage,
    required this.voteCount,
    required this.popularity,
    required this.genreIds,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalName,
    required this.language,
    required this.pageNumber,
    required this.cachedAt,
    required this.tmdbIdLanguage,
  });

  factory LocalTVShowModel. fromTmdbModel(
    TmdbTVShowModel tmdbModel, {
    required String language,
    required int pageNumber,
  }) {
    final tmdbIdLanguageKey = '${tmdbModel. id}_$language';
    return LocalTVShowModel(
      tmdbId: tmdbModel.id,
      name: tmdbModel.name,
      overview: tmdbModel.overview,
      posterPath: tmdbModel.posterPath,
      backdropPath: tmdbModel.backdropPath,
      firstAirDate: tmdbModel.firstAirDate,
      voteAverage: tmdbModel.voteAverage,
      voteCount: tmdbModel.voteCount,
      popularity: tmdbModel.popularity,
      genreIds: tmdbModel.genreIds,
      originCountry: tmdbModel.originCountry,
      originalLanguage: tmdbModel.originalLanguage,
      originalName: tmdbModel.originalName,
      language: language,
      pageNumber:  pageNumber,
      cachedAt: DateTime.now(),
      tmdbIdLanguage: tmdbIdLanguageKey,
    );
  }

  TVShow toEntity() {
    return TVShow(
      id: tmdbId,
      name: name,
      overview: overview,
      posterPath: posterPath,
      backdropPath: backdropPath,
      firstAirDate:  firstAirDate,
      voteAverage: voteAverage,
      voteCount: voteCount,
      popularity: popularity,
      genreIds: genreIds,
      originCountry: originCountry,
      originalLanguage: originalLanguage,
      originalName: originalName,
    );
  }
}
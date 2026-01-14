import '../../domain/entities/tv_show.dart';

class TmdbTVShowModel {
  final int id;
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

  const TmdbTVShowModel({
    required this.id,
    required this.name,
    required this.overview,
    required this.posterPath,
    required this.backdropPath,
    required this.firstAirDate,
    required this.voteAverage,
    required this.voteCount,
    required this.popularity,
    required this.genreIds,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalName,
  });

  factory TmdbTVShowModel.fromJson(Map<String, dynamic> json) {
    return TmdbTVShowModel(
      id: json['id'],
      name: json['name'],
      overview: json['overview'] ?? '',
      posterPath: json['poster_path'] ?? '',
      backdropPath: json['backdrop_path'] ?? '',
      firstAirDate: json['first_air_date'] ?? '',
      voteAverage: (json['vote_average'] as num).toDouble(),
      voteCount: json['vote_count'],
      popularity: (json['popularity'] as num).toDouble(),
      genreIds: List<int>.from(json['genre_ids']),
      originCountry: List<String>.from(json['origin_country']),
      originalLanguage: json['original_language'],
      originalName: json['original_name'],
    );
  }

  // Convert to domain entity
  TVShow toEntity() {
    return TVShow(
      id: id,
      name: name,
      overview: overview,
      posterPath: posterPath,
      backdropPath: backdropPath,
      firstAirDate: firstAirDate,
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
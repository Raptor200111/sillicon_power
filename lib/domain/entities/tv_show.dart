class TVShow {
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

  const TVShow({
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
}
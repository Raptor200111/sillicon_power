import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/movie.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class TmdbService {
  static String get tmdbApiKey {
    final key = dotenv.env['TMDB_API_KEY'];
    if (key == null || key.isEmpty) {
      throw Exception('TMDB_API_KEY is not set in .env');
    }
    return key;
  }

  static String get tmdbPopularTVurl {
    return 'https://api.themoviedb.org/3/tv/popular?api_key=$tmdbApiKey';
  }

  static Future<List<Movie>> fetchPopularTvShows() async {
    final response = await http.get(Uri.parse(tmdbPopularTVurl));

    if (response.statusCode == 200) {
      final decoded = json.decode(response.body);
      final List results = decoded['results'];

      return results.map((json) => Movie.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load popular TV shows');
    }
  }
}

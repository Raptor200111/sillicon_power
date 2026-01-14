import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/tmdb_tv_show_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class TmdbDatasource {
  static String get tmdbApiKey {
    final key = dotenv.env['TMDB_API_KEY'];
    if (key == null || key.isEmpty) {
      throw Exception('TMDB_API_KEY is not set in .env');
    }
    return key;
  }

  String tmdbPopularTVurl(int page) {
    return 'https://api.themoviedb.org/3/tv/popular?page=$page&api_key=$tmdbApiKey';
  }

  Future<List<TmdbTVShowModel>> fetchPopularTvShows(int page) async {
    final response = await http.get(Uri.parse(tmdbPopularTVurl(page)));

    if (response.statusCode == 200) {
      final decoded = json.decode(response.body);
      final List results = decoded['results'];

      return results.map((json) => TmdbTVShowModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load popular TV shows');
    }
  }

  Future<int> fetchTotalPages() async {
    final response = await http.get(Uri.parse(tmdbPopularTVurl(1)));

    if (response.statusCode == 200) {
      final decoded = json.decode(response.body);
      return decoded['total_pages'];
    } else {
      throw Exception('Failed to load total pages');
    }
  }

  Future<Map<int, String>> fetchTvShowGenreMap() async {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/genre/tv/list?api_key=$tmdbApiKey'));

    if (response.statusCode == 200) {
      final decoded = json.decode(response.body);
      final List genres = decoded['genres'];

      return {
        for (var genre in genres) genre['id'] as int: genre['name'] as String
      };
    } else {
      throw Exception('Failed to load genres');
    }
  }
}

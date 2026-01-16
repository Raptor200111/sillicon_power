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

  String tmdbPopularTVurl(int page, String languageCode) {
    return 'https://api.themoviedb.org/3/tv/popular?page=$page&language=$languageCode&api_key=$tmdbApiKey';
  }

  String tmdbGenreTVurl(String languageCode) {
    return 'https://api.themoviedb.org/3/genre/tv/list?language=$languageCode&api_key=$tmdbApiKey';
  }


  Future<List<TmdbTVShowModel>> fetchPopularTvShows(int page, String languageCode) async {
    final response = await http.get(Uri.parse(tmdbPopularTVurl(page, languageCode)));

    if (response.statusCode == 200) {
      final decoded = json.decode(response.body);
      final List results = decoded['results'];

      return results.map((json) => TmdbTVShowModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load popular TV shows');
    }
  }

  Future<int> fetchTotalPages() async {
    final response = await http.get(Uri.parse(tmdbPopularTVurl(1, 'en')));

    if (response.statusCode == 200) {
      final decoded = json.decode(response.body);
      return decoded['total_pages'];
    } else {
      throw Exception('Failed to load total pages');
    }
  }

  Future<Map<int, String>> fetchTvShowGenreMap(String languageCode) async {
    final response = await http.get(Uri.parse(tmdbGenreTVurl(languageCode)));

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
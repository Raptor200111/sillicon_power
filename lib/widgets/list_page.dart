import 'package:flutter/material.dart';
import 'package:sillicon_power/services/tmdb_service.dart';
import 'package:sillicon_power/widgets/movie_item.dart';
import '../../models/movie.dart';

class ListPage extends StatelessWidget {

  final int page;
  ListPage({super.key, required this.page});
  
  @override
  Widget build(BuildContext context) {
    Future<List<Movie>> _movies = TmdbService.fetchPopularTvShows(page);
    return FutureBuilder<List<Movie>>(
          future: _movies,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Text('No popular TV shows found.');
            } else {
              final movies = snapshot.data!;
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                ),
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  return MovieItem(movie: movies[index]);
                },
              );
            }
          },
        );
  }
}
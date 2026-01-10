import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sillicon_power/widgets/movie_item.dart';
import 'package:sillicon_power/services/tmdb_service.dart';
import 'package:sillicon_power/models/movie.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Future<List<Movie>> _movies = TmdbService.fetchPopularTvShows();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),

      body: Center(
        child: FutureBuilder<List<Movie>>(
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
              return ListView.builder(
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  return MovieItem(movie: movies[index]);
                },
              );
            }
          },
        ),
      ),
    );
  }
}

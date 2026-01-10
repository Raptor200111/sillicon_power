import 'package:flutter/material.dart';
import '../../models/movie.dart';

class MovieItem extends StatelessWidget {
  final Movie movie;

  const MovieItem({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(8.0),
      child: Container(
        //height: 100,
        color: Colors.deepPurple,
        child: movie.posterPath != null
            ? Image.network(
                'https://image.tmdb.org/t/p/w500' + movie.posterPath,
                fit: BoxFit.cover,
              )
            : const Text('No Image Available', style: TextStyle(color: Colors.white),
        ),

      ),
    );
  }
}

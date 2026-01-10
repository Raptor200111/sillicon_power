import 'package:flutter/material.dart';
import '../../models/movie.dart';

class MovieItem extends StatelessWidget {
  final Movie movie;

  const MovieItem({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 100,
        color: Colors.deepPurple,
        child: Text(movie.name),
      ),
    );
  }
}

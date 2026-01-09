import 'package:flutter/material.dart';
import 'package:sillicon_power/movie_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List _movies = [
    'Movie 1',
    'Movie 2',
    'Movie 3',
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),

      body: Center(
        child: ListView.builder(
          itemCount: _movies.length,
          itemBuilder: (context, index) {
            return MovieItem(
              title: _movies[index],
            );
          })
      ),
    );
  }
}

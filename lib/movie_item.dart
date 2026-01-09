import 'package:flutter/material.dart';

class MovieItem extends StatelessWidget {
  final String title;

  const MovieItem({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 100,
        color: Colors.deepPurple,
        child: Text(title),
      ),
    );
  }
}
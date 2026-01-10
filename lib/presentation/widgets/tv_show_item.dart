import 'dart:html';

import 'package:flutter/material.dart';
import '../../domain/entities/tv_show.dart';

class TVShowItem extends StatelessWidget {
  final TVShow tvShow;

  const TVShowItem({super.key, required this.tvShow});

  @override
  Widget build(BuildContext context) {
    return ListTile(

      //size: MediaQuery.of(context).size.width * 0.5,
      leading: tvShow.posterPath.isNotEmpty
          ? Image.network('https://image.tmdb.org/t/p/w200${tvShow.posterPath}')
          : const Icon(Icons.tv),
      title: Text(tvShow.name),
      subtitle: Text(tvShow.overview),
    );
  }
}
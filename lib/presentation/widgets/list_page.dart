import 'package:flutter/material.dart';
import '../../domain/entities/tv_show.dart';
import '../pages/tv_show_page.dart';
import 'tv_show_item.dart';

class ListPage extends StatelessWidget {
  final int page;
  final List<TVShow> tvShows;
  final Map<int, String> genres;

  const ListPage({super.key, required this.page, required this.tvShows, required this.genres});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tvShows.length,
      itemBuilder: (context, index) {
        return TVShowItem(
          tvShow: tvShows[index],
          onTap: () {
            //print('${tvShows[index].name}');
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TvShowPage(tvShow: tvShows[index], genres: genres),
              ),
            );
          },
        );
      },
    );
  }
}
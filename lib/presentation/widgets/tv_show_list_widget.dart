import 'package:flutter/material.dart';
import '../../domain/entities/tv_show.dart';
import '../pages/tv_show_page.dart';
import 'tv_show_item.dart';

class ListPageWidget extends StatelessWidget {
  final int page;
  final List<TVShow> tvShows;
  final Map<int, String> genres;
  final int totalPages;
  final VoidCallback onPreviousPage;
  final VoidCallback onNextPage;

  const ListPageWidget({
    super.key,
    required this.page,
    required this.tvShows,
    required this.genres,
    required this.totalPages,
    required this.onPreviousPage,
    required this.onNextPage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...tvShows.map((tvShow) {
          return TVShowItem(
            tvShow: tvShow,
            onTap: () {
              //print('${tvShow.name}');
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TvShowPage(tvShow: tvShow, genres: genres),
                ),
              );
            },
          );
        }).toList(),
        // Page controller at the end
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: onPreviousPage,
                child: const Text('<'),
              ),
              const SizedBox(width: 16),
              Text('Page $page of ${totalPages > 500 ? '500' : '$totalPages'}'),
              const SizedBox(width: 16),
              ElevatedButton(
                onPressed: onNextPage,
                child: const Text('>'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
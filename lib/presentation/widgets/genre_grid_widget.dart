import 'package:flutter/material.dart';
import 'package:sillicon_power/domain/entities/tv_show.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class GenreGridWidget extends StatelessWidget {
  final TVShow tvShow;
  final Map<int, String> genres;

  const GenreGridWidget({super.key, required this.tvShow, required this.genres});
  
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        for (var genre in tvShow.genreIds)
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              genres[genre] ?? AppLocalizations.of(context)!.unknown,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
      ],
    );
  }
}
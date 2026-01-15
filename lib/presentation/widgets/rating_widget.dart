import 'package:flutter/material.dart';
import 'package:sillicon_power/domain/entities/tv_show.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RatingWidget extends StatelessWidget {
  final TVShow tvShow;

  const RatingWidget({Key? key, required this.tvShow}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          child: Icon(Icons.star, size: 16, color: Theme.of(context).colorScheme.tertiary),
          ),
          Text(tvShow.voteAverage.toStringAsFixed(1),
              style: Theme.of(context).textTheme.bodyMedium),
          Text(' (${tvShow.voteCount}${tvShow.voteCount == 1 ? ' ${AppLocalizations.of(context)!.vote})' : ' ${AppLocalizations.of(context)!.votes})'}',
              style: Theme.of(context).textTheme.bodySmall),
      ],
    );
  }
}
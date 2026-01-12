import 'package:flutter/material.dart';
import 'package:sillicon_power/domain/entities/tv_show.dart';

class RatingWidget extends StatelessWidget {
  final TVShow tvShow;

  const RatingWidget({Key? key, required this.tvShow}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          child: const Icon(Icons.star, size: 16, color: Colors.orange),
          ),
          Text(tvShow.voteAverage.toStringAsFixed(1),
              style: const TextStyle(fontSize: 14)),
          Text(' (${tvShow.voteCount}${tvShow.voteCount == 1 ? ' vote)' : ' votes)'}',
              style: const TextStyle(fontSize: 14, color: Colors.grey)),
      ],
    );
  }
}
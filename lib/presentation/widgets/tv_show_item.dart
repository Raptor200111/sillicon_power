import 'package:flutter/material.dart';
import 'package:sillicon_power/presentation/widgets/rating_widget.dart';
import '../../domain/entities/tv_show.dart';

class TVShowItem extends StatelessWidget {
  final TVShow tvShow;
  final VoidCallback? onTap;

  const TVShowItem({super.key, required this.tvShow, this.onTap});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final widgetWidth = screenWidth * 0.9;
    
    return Container(
      width: widgetWidth,
      height: 200,
      margin: EdgeInsets.symmetric(
        horizontal: (screenWidth - widgetWidth) / 2,
        vertical: 8,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: tvShow.posterPath.isNotEmpty
                ? Image.network(
                    'https://image.tmdb.org/t/p/w200${tvShow.posterPath}',
                    fit: BoxFit.cover,
                  )
                : Container(
                    color: Colors.grey[300],
                    child: Icon(Icons.tv, size: widgetWidth * 0.1),
                  ),
          ),
          // Title, Overview, and Button on the right
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    tvShow.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  
                  RatingWidget(tvShow: tvShow),
                  
                  const Expanded(child: SizedBox(height: 8)),
                  
                  Row(children: [
                    Text(tvShow.firstAirDate,
                        style: const TextStyle(fontSize: 14, color: Colors.grey)),
                    
                    const Expanded(child: SizedBox(height: 8)),

                    SizedBox(
                      //width: 100,
                      child: ElevatedButton(
                        onPressed: onTap,
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                        ),
                        child: const Icon(
                          Icons.info_outline,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    ]),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
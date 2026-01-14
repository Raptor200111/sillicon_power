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
    final screenHeight = MediaQuery.of(context).size.height;
    final widgetWidth = screenWidth * 0.9;
    
    return Container(
      width: widgetWidth,
      height: screenHeight * 0.255,
      margin: EdgeInsets.symmetric(
        horizontal: (screenWidth - widgetWidth) / 2,
        vertical: (screenWidth - widgetWidth) / 4,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              'https://image.tmdb.org/t/p/w200${tvShow.posterPath}',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                height: screenHeight * 0.255,
                width: widgetWidth * 0.35,
                color: Theme.of(context).colorScheme.inversePrimary,
                child: Icon(Icons.tv, size: widgetWidth * 0.1),
              ),
            )
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
                    style: Theme.of(context).textTheme.headlineMedium,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  
                  RatingWidget(tvShow: tvShow),
                  
                  const Expanded(child: SizedBox(height: 8)),
                  
                  Row(children: [
                    Text(tvShow.firstAirDate,
                        style: Theme.of(context).textTheme.bodyMedium),
                    const Expanded(child: SizedBox(height: 8)),

                    SizedBox(
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
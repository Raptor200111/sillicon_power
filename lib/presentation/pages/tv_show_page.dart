import 'package:flutter/material.dart';
import 'package:sillicon_power/domain/entities/tv_show.dart';
import 'package:sillicon_power/presentation/widgets/genre_grid_widget.dart';

import '../widgets/rating_widget.dart';

class TvShowPage extends StatelessWidget {
  const TvShowPage({super.key, required this.tvShow, required this.genres});
  final TVShow tvShow;
  final Map<int, String> genres;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    
    final widgetWidth = screenWidth * 0.9;

    return Scaffold(
        backgroundColor: Colors.white,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        ClipRRect(
                          child: tvShow.backdropPath.isNotEmpty
                              ? Image.network(
                                  'https://image.tmdb.org/t/p/w500${tvShow.backdropPath}',
                                  fit: BoxFit.cover,
                                  width: screenWidth,
                                  //height: 200,
                                )
                              : Container(
                                  color: Colors.grey[300],
                                  width: screenWidth,
                                  //height: 200,
                                  child: Icon(Icons.tv, size: widgetWidth * 0.1),
                                ),
                        ),
                        Positioned(
                          left: screenWidth * 0.05,
                          bottom: screenHeight * -0.25,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  blurRadius: 12,
                                  offset: const Offset(0, 8),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: tvShow.posterPath.isNotEmpty
                                  ? Image.network(
                                      'https://image.tmdb.org/t/p/w200${tvShow.posterPath}',
                                      width: screenWidth * 0.4,
                                      fit: BoxFit.cover,
                                      //height: 260,
                                    )
                                  : Container(
                                      color: Colors.grey[300],
                                      width: screenWidth * 0.5,
                                      height: 260,
                                      child: Icon(Icons.tv, size: widgetWidth * 0.1),
                                    ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: screenWidth * 0.5, right: 0, top: screenWidth * 0.025, bottom: screenWidth * 0.05),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            tvShow.name,
                            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          RatingWidget(tvShow: tvShow),
                          const SizedBox(height: 8),
                          Text(
                            "Popularity: ${tvShow.popularity.toStringAsFixed(1)}",
                            style: const TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "First Air Date: ${tvShow.firstAirDate}",
                            style: const TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.10),
                    GenreGridWidget(tvShow: tvShow, genres: genres),
                    Padding(padding:  EdgeInsets.all(screenWidth * 0.05),
                      child: Text(
                        tvShow.overview,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                      Text("Origin Language: ${tvShow.originalLanguage}", textAlign: TextAlign.left),
                      Text("Original Name: ${tvShow.originalName}", textAlign: TextAlign.left),
                      Text("Origin Country: ${tvShow.originCountry.join(', ')}", textAlign: TextAlign.left),
                      
                    ],
                  ),
        );
    }
  }
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
    
    Image backdropImage = tvShow.backdropPath.isNotEmpty
        ? Image.network(
            'https://image.tmdb.org/t/p/w500${tvShow.backdropPath}',
            fit: BoxFit.cover,
          )
        : Container(
            color: Colors.grey[300],
            width: screenWidth,
            child: Icon(Icons.tv, size: screenWidth * 0.1),
          ) as Image;
    
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: CustomScrollView(

        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: true,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.grey),
              onPressed: () => Navigator.pop(context),
            ),
            backgroundColor: Colors.transparent,
            expandedHeight: screenHeight * 0.25,
            //toolbarHeight: 150,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: backdropImage,
            ),
            elevation: 0,
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(screenWidth * 0.05),
                      child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: tvShow.posterPath.isNotEmpty
                              ? Image.network(
                                  'https://image.tmdb.org/t/p/w200${tvShow.posterPath}',
                                  width: screenWidth * 0.4,
                                  //height: 260,
                                  fit: BoxFit.cover,
                                )
                              : Container(
                                  color: Colors.grey[300],
                                  width: screenWidth * 0.5,
                                  height: 260,
                                  child: Icon(Icons.tv, size: screenWidth * 0.1),
                                ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: screenWidth * 0.05),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  tvShow.name,
                                  //maxLines: 2,
                                  overflow: TextOverflow.visible,
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
                        ),
                      ]
                    ),
                  ),
                    GenreGridWidget(tvShow: tvShow, genres: genres),
                    Padding(padding:  EdgeInsets.all(screenWidth * 0.05),
                      child: Text(
                        tvShow.overview,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    Padding(padding:  EdgeInsets.only(left: screenWidth * 0.05, right: screenWidth * 0.05, bottom: screenWidth * 0.05),
                      child: Row(
                        children:[
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Original Name: ${tvShow.originalName}", maxLines: null, overflow: TextOverflow.clip),
                                Text("Origin Language: ${tvShow.originalLanguage}", maxLines: null, overflow: TextOverflow.clip),
                                Text("Origin Country: ${tvShow.originCountry.join(', ')}", maxLines: null, overflow: TextOverflow.clip),
                                //Text("Original Name: ${tvShow.originalName}\nOrigin Language: ${tvShow.originalLanguage}", maxLines: null, overflow: TextOverflow.clip)
                              ],
                            ),
                          ),
                        ]
                      ),)
                    ],
                  ),
          )
        ],
      )
    );
  }
}
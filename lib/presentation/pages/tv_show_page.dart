import 'package:flutter/material.dart';
import 'package:sillicon_power/domain/entities/tv_show.dart';
import 'package:sillicon_power/presentation/widgets/genre_grid_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../widgets/rating_widget.dart';

class TvShowPage extends StatelessWidget {
  const TvShowPage({super.key, required this.tvShow, required this.genres});
  final TVShow tvShow;
  final Map<int, String> genres;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    
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
              background: Image.network(
            'https://image.tmdb.org/t/p/w500${tvShow.backdropPath}',
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Container(
                height: screenHeight * 0.255,
                width: screenWidth,
                color: Theme.of(context).colorScheme.inversePrimary,
                child: Icon(Icons.tv, size: screenWidth * 0.1),
              ),
          ),
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
                          child: Image.network(
                            'https://image.tmdb.org/t/p/w200${tvShow.posterPath}',
                            width: screenWidth * 0.4,
                            //height: 260,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) => Container(
                              height: screenHeight * 0.3,
                              width: screenWidth * 0.4,
                              color: Theme.of(context).colorScheme.inversePrimary,
                              child: Icon(Icons.tv, size: screenWidth * 0.1),
                            ),
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
                                  overflow: TextOverflow.visible,
                                  style: Theme.of(context).textTheme.headlineLarge,
                                ),
                                const SizedBox(height: 8),
                                RatingWidget(tvShow: tvShow),
                                const SizedBox(height: 8),
                                Text(
                                  "${AppLocalizations.of(context)!.popularity}: ${tvShow.popularity.toStringAsFixed(1)}",
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  "${AppLocalizations.of(context)!.firstAirDate}: ${tvShow.firstAirDate}",
                                  style: Theme.of(context).textTheme.bodyMedium,
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
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                    Padding(padding:  EdgeInsets.only(left: screenWidth * 0.05, right: screenWidth * 0.05, bottom: screenWidth * 0.05),
                      child: Row(
                        children:[
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("${AppLocalizations.of(context)!.originalName}: ${tvShow.originalName}", maxLines: null, overflow: TextOverflow.clip, style: Theme.of(context).textTheme.bodyMedium),
                                Text("${AppLocalizations.of(context)!.originalLanguage}: ${tvShow.originalLanguage}", maxLines: null, overflow: TextOverflow.clip, style: Theme.of(context).textTheme.bodyMedium),
                                Text("${AppLocalizations.of(context)!.originCountry}: ${tvShow.originCountry.join(', ')}", maxLines: null, overflow: TextOverflow.clip, style: Theme.of(context).textTheme.bodyMedium),
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
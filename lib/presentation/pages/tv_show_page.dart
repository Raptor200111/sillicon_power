import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sillicon_power/domain/entities/tv_show.dart';
import 'package:sillicon_power/presentation/bloc/tv_show_genre/tv_show_genre_bloc.dart';
import 'package:sillicon_power/presentation/bloc/tv_show_genre/tv_show_genre_event.dart';
import 'package:sillicon_power/presentation/bloc/tv_show_genre/tv_show_genre_state.dart';
import 'package:sillicon_power/presentation/widgets/genre_grid_widget.dart';
import '../../core/di/service_locator.dart';
import 'package:palette_generator/palette_generator.dart';

import '../widgets/rating_widget.dart';

class TvShowPage extends StatefulWidget {
  const TvShowPage({super.key, required this.tvShow});
  final TVShow tvShow;

  @override
  State<TvShowPage> createState() => _TvShowPageState();
}

class _TvShowPageState extends State<TvShowPage> {
  Color _arrowColor = Colors.white;

  @override
  void initState() {
    super.initState();
    _updateArrowColor();
  }

  Future<void> _updateArrowColor() async {
    if (widget.tvShow.backdropPath.isNotEmpty) {
      try {
        final imageProvider = NetworkImage(
          'https://image.tmdb.org/t/p/w500${widget.tvShow.backdropPath}',
        );
        final paletteGenerator = await PaletteGenerator.fromImageProvider(imageProvider);
        
        final dominantColor = paletteGenerator.dominantColor?.color ?? Colors.grey;
        final brightness = ThemeData.estimateBrightnessForColor(dominantColor);
        
        setState(() {
          _arrowColor = brightness == Brightness.light ? Colors.black : Colors.white;
        });
      } catch (e) {
        setState(() {
          _arrowColor = Colors.white;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    
    final widgetWidth = screenWidth * 0.9;

    return BlocProvider(
      create: (_) => getIt<TvShowGenreBloc>()
        ..add(const LoadTvShowGenre()),
      child: Scaffold(
        backgroundColor: Colors.white,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: _arrowColor),
            onPressed: () => Navigator.pop(context),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: BlocBuilder<TvShowGenreBloc, TvShowGenreState>(
          builder: (context, state) {
            if (state is TvShowGenreLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is TvShowGenreError) {
              return Center(child: Text('Error: ${state.message}'));
            } else if (state is TvShowGenreLoaded) {
              state.genres; // You can use this map if needed
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        ClipRRect(
                          child: widget.tvShow.backdropPath.isNotEmpty
                              ? Image.network(
                                  'https://image.tmdb.org/t/p/w500${widget.tvShow.backdropPath}',
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
                              child: widget.tvShow.posterPath.isNotEmpty
                                  ? Image.network(
                                      'https://image.tmdb.org/t/p/w200${widget.tvShow.posterPath}',
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
                            widget.tvShow.name,
                            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          RatingWidget(tvShow: widget.tvShow),
                          const SizedBox(height: 8),
                          Text(
                            "Popularity: ${widget.tvShow.popularity.toStringAsFixed(1)}",
                            style: const TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "First Air Date: ${widget.tvShow.firstAirDate}",
                            style: const TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.10),
                    GenreGridWidget(tvShow: widget.tvShow, genres: state.genres),
                    Padding(padding:  EdgeInsets.all(screenWidth * 0.05),
                      child: Text(
                        widget.tvShow.overview,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    Text("Origin Language: ${widget.tvShow.originalLanguage}", textAlign: TextAlign.left),
                    Text("Original Name: ${widget.tvShow.originalName}", textAlign: TextAlign.left),
                    Text("Origin Country: ${widget.tvShow.originCountry.join(', ')}", textAlign: TextAlign.left),
                    
                  ],
                ),
              );
            }
            return const Center(child: Text('No data'));
          },
        ),
      ),
    );
  }
}
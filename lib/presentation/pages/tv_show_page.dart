import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sillicon_power/domain/entities/tv_show.dart';
import 'package:sillicon_power/presentation/bloc/tv_show_genre/tv_show_genre_bloc.dart';
import 'package:sillicon_power/presentation/bloc/tv_show_genre/tv_show_genre_event.dart';
import 'package:sillicon_power/presentation/bloc/tv_show_genre/tv_show_genre_state.dart';
import '../../core/di/service_locator.dart';

class TvShowPage extends StatefulWidget {
  const TvShowPage({super.key, required this.tvShow});
  final TVShow tvShow;

  @override
  State<TvShowPage> createState() => _TvShowPageState();
}

class _TvShowPageState extends State<TvShowPage> {

  //context.read<PopularTVBloc>().add(LoadPopularTVShows(_currentPageIndex + 1));
  
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<TvShowGenreBloc>()
        ..add(const LoadTvShowGenre()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.tvShow.name),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        
        body: BlocBuilder<TvShowGenreBloc, TvShowGenreState>(
          builder: (context, state) {
            if (state is TvShowGenreLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is TvShowGenreError) {
              return Center(child: Text('Error: ${state.message}'));
            } else if (state is TvShowGenreLoaded) {
              return Column(
                children: [
                  Text(widget.tvShow.overview),
                ],
              );
            }
            return const Center(child: Text('No data'));
          },
        ),
      ),
    );
  }
}
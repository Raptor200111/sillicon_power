import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/di/service_locator.dart';
import '../bloc/popular_tv/popular_tv_bloc.dart';
import '../bloc/popular_tv/popular_tv_event.dart';
import '../bloc/popular_tv/popular_tv_state.dart';
import '../widgets/tv_show_list_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPageIndex = 0;
  
  @override
  void initState() {
    super.initState();
      setState(() {
        _currentPageIndex = 0;
      });
  }

  void _goToPreviousPage(BuildContext context) {
    if (_currentPageIndex > 0) {
      _currentPageIndex--;
      context.read<PopularTVBloc>().add(LoadPopularTVShows(_currentPageIndex + 1));
    }
  }

  void _goToNextPage(BuildContext context, int totalPages) {
    if (_currentPageIndex < totalPages - 1) {
      _currentPageIndex++;
      context.read<PopularTVBloc>().add(LoadPopularTVShows(_currentPageIndex + 1));
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      home: BlocProvider(
        create: (_) => getIt<PopularTVBloc>()
          ..add(const LoadTvShowInfo())
          ..add(const LoadPopularTVShows(1)),
        child: Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                //pinned: true,
                expandedHeight: 0,
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(color: Theme.of(context).colorScheme.inversePrimary),
                  title: Text(widget.title),
                ),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.more_horiz),
                    onPressed: () => print('More options'), //ToDo: implement config_page
                  ),
                ],
              ),
              SliverToBoxAdapter(
                child: BlocBuilder<PopularTVBloc, PopularTVState>(
                  builder: (context, state) {
                    if (state is PopularTVLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is PopularTVError) {
                      return Center(child: Text('Error: ${state.message}'));
                    } else if (state is PopularTVLoaded) {
                      return ListPageWidget(genres: state.genreMap, page: _currentPageIndex + 1, tvShows: state.tvShows, totalPages: state.totalPages, onPreviousPage: () => _goToPreviousPage(context), onNextPage: () => _goToNextPage(context, state.totalPages),);
                      }
                    return const Center(child: Text('No data'));
                  },
                ),
              )
            ],
          ) 
        ),
      )
    );
  }
}
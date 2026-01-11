import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sillicon_power/domain/entities/tv_show.dart';
import '../../core/di/service_locator.dart';
import '../bloc/popular_tv/popular_tv_bloc.dart';
import '../bloc/popular_tv/popular_tv_event.dart';
import '../bloc/popular_tv/popular_tv_state.dart';
import '../widgets/list_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _pageController;
  int _currentPageIndex = 0;
  
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _pageController.addListener(() {
      setState(() {
        _currentPageIndex = (_pageController.page ?? 1).round();
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Widget buildPage(int index, List<TVShow> tvShows) {
    return ListPage(page: index + 1, tvShows: tvShows);
  }

  void _goToPreviousPage(BuildContext context) {
    if (_currentPageIndex > 0) {
      _currentPageIndex--;
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      context.read<PopularTVBloc>().add(LoadPopularTVShows(_currentPageIndex + 1));
    }
  }

  void _goToNextPage(BuildContext context, int totalPages) {
    if (_currentPageIndex < totalPages - 1) {
      _currentPageIndex++;
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      context.read<PopularTVBloc>().add(LoadPopularTVShows(_currentPageIndex + 1));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<PopularTVBloc>()
        ..add(const LoadTotalPages())
        ..add(const LoadPopularTVShows(1)),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: BlocBuilder<PopularTVBloc, PopularTVState>(
          builder: (context, state) {
            if (state is PopularTVLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is PopularTVError) {
              return Center(child: Text('Error: ${state.message}'));
            } else if (state is PopularTVLoaded) {
              return Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                      controller: _pageController,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => buildPage(index, state.tvShows),
                      itemCount: state.totalPages,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () => _goToPreviousPage(context),
                          child: const Text('Previous'),
                        ),
                        const SizedBox(width: 16),
                        Text('Page ${_currentPageIndex + 1} of ${state.totalPages}'),
                        const SizedBox(width: 16),
                        ElevatedButton(
                          onPressed: () => _goToNextPage(context, state.totalPages),
                          child: const Text('Next'),
                        ),
                      ],
                    ),
                  ),
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
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sillicon_power/widgets/list_page.dart';
import 'package:sillicon_power/services/tmdb_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //final Future<List<Movie>> _movies = TmdbService.fetchPopularTvShows(1);
  final Future<int> _totalPages = TmdbService.fetchTotalPages();
  late PageController _pageController;
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _pageController.addListener(() {
      setState(() {
        _currentPageIndex = (_pageController.page ?? 0).round();
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Widget buildPage(int index) {
    return ListPage(page: index + 1);
  }

  void _goToPreviousPage() {
    if (_currentPageIndex > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _goToNextPage(int totalPages) {
    if (_currentPageIndex < totalPages - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: FutureBuilder<int>(
          future: _totalPages,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData) {
              return const Text('Could not fetch total pages.');
            } else {
              final totalPages = snapshot.data!;
              return Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                      controller: _pageController,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => buildPage(index),
                      itemCount: totalPages,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: _goToPreviousPage,
                        child: const Text('Previous'),
                      ),
                      const SizedBox(width: 16),
                      Text('Page ${_currentPageIndex + 1} of $totalPages'),
                      const SizedBox(width: 16),
                      ElevatedButton(
                        onPressed: () => _goToNextPage(totalPages),
                        child: const Text('Next'),
                      ),
                    ],
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}

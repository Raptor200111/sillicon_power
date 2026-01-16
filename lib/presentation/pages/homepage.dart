import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sillicon_power/presentation/pages/config_page.dart';
import '../bloc/popular_tv/popular_tv_bloc.dart';
import '../bloc/popular_tv/popular_tv_event.dart';
import '../bloc/popular_tv/popular_tv_state.dart';
import '../widgets/tv_show_list_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../core/di/service_locator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPageIndex = 0;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _goToPreviousPage(BuildContext context) {
    if (_currentPageIndex > 0) {
      _currentPageIndex--;
      context
          .read<PopularTVBloc>()
          .add(LoadPageWithBackground(_currentPageIndex + 1));
      _scrollToTop();
    }
  }

  void _goToNextPage(BuildContext context, int totalPages) {
    if (_currentPageIndex < totalPages - 1) {
      _currentPageIndex++;
      context
          .read<PopularTVBloc>()
          .add(LoadPageWithBackground(_currentPageIndex + 1));
      _scrollToTop();
    }
  }

  void _scrollToTop() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (mounted && _scrollController.hasClients) {
        _scrollController.animateTo(
          0.0,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<PopularTVBloc>()
        ..add(const LoadTvShowInfo())
        ..add(const DownloadAllPages()),
      child: Scaffold(
        body: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverAppBar(
              floating: true,
              expandedHeight: 0,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                    color: Theme.of(context).colorScheme.secondary),
                title: Text(widget.title,
                    style: Theme.of(context).textTheme.titleLarge),
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.more_horiz),
                  onPressed:  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ConfigPage()),
                  ),
                ),
              ],
            ),
            BlocBuilder<PopularTVBloc, PopularTVState>(
              builder: (context, state) {
                if (state is DownloadingPages) {
                  return SliverFillRemaining(
                    hasScrollBody: false,
                    child:  Center(
                      child: Column(
                        mainAxisAlignment:  MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(
                            value: state.downloadedPages / state.totalPages,
                            color: Colors.black,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Downloading pages...\n${state.downloadedPages}/${state. totalPages}',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      ),
                    ),
                  );
                }

                if (state is PopularTVLoading) {
                  return const SliverFillRemaining(
                    hasScrollBody: false,
                    child: Center(
                      child: CircularProgressIndicator(color: Colors.black),
                    ),
                  );
                }

                if (state is PopularTVError) {
                  return SliverFillRemaining(
                    hasScrollBody: false,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Something went wrong',
                            style:  Theme.of(context).textTheme.bodyLarge,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            state.message,
                            style: Theme.of(context).textTheme.bodySmall,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  );
                }

                if (state is PopularTVLoaded) {
                  return SliverToBoxAdapter(
                    child: Stack(
                      children: [
                        ListPageWidget(
                          genres: state.genreMap,
                          page: _currentPageIndex + 1,
                          tvShows: state.tvShows,
                          totalPages:  500,
                          onPreviousPage: () => _goToPreviousPage(context),
                          onNextPage: () => _goToNextPage(context, 500),
                        ),
                        if (state.isRefreshing)
                          Positioned(
                            top: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              color: Colors.blue. withOpacity(0.3),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 16),
                              child: Row(
                                mainAxisAlignment:  MainAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    width: 16,
                                    height: 16,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      valueColor: AlwaysStoppedAnimation(
                                          Colors.blue),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    AppLocalizations.of(context)?.updating ??
                                        'Updating...',
                                    style: const TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
                  );
                }

                return const SliverFillRemaining(
                  hasScrollBody:  false,
                  child: Center(child: Text('No data')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
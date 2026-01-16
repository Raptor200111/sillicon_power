import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sillicon_power/presentation/pages/config_page.dart';
import 'package:sillicon_power/presentation/theme/language_provider.dart';
import '../bloc/popular_tv/popular_tv_bloc.dart';
import '../bloc/popular_tv/popular_tv_event.dart';
import '../bloc/popular_tv/popular_tv_state.dart';
import '../widgets/tv_show_list_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPageIndex = 0;
  String? _prevLanguage;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final languageCode = context.watch<LanguageProvider>().currentLanguage;
    if (_prevLanguage != languageCode) {
      _prevLanguage = languageCode;
      context.read<PopularTVBloc>()
        ..add(LoadTvShowInfo(languageCode))
        ..add(LoadPopularTVShowsWithCache(_currentPageIndex + 1, languageCode));
    }
  }

  void _goToPreviousPage(BuildContext context) {
    if (_currentPageIndex > 0) {
      _currentPageIndex--;
      final languageCode = context.read<LanguageProvider>().currentLanguage;
      context
        .read<PopularTVBloc>()
        .add(LoadPopularTVShowsWithCache(_currentPageIndex + 1, languageCode));
    }
  }

  void _goToNextPage(BuildContext context, int totalPages) {
    if (_currentPageIndex < totalPages - 1) {
      _currentPageIndex++;
      final languageCode = context.read<LanguageProvider>().currentLanguage;
      context
        .read<PopularTVBloc>()
        .add(LoadPopularTVShowsWithCache(_currentPageIndex + 1, languageCode));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            expandedHeight: 0,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(color: Theme.of(context).colorScheme.secondary),
              title: Text(widget.title, style: Theme.of(context).textTheme.titleLarge),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons. more_horiz),
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ConfigPage())),
              ),
            ],
          ),
          BlocBuilder<PopularTVBloc, PopularTVState>(
            builder: (context, state) {
              if (state is PopularTVLoading) {
                return const SliverFillRemaining(hasScrollBody: false, child: Center(child: CircularProgressIndicator(color: Colors.black)));
              }
              if (state is PopularTVError) {
                return SliverFillRemaining(hasScrollBody: false, child: Center(child: Text(AppLocalizations.of(context)! .error)));
              }
              if (state is PopularTVLoadedFromCache) {
                final realTotalPages = state.totalPages > 500 ? 500 : state. totalPages;
                return SliverToBoxAdapter(
                  child:  Stack(
                    children: [
                      ListPageWidget(
                        genres: state.genreMap,
                        page: _currentPageIndex + 1,
                        tvShows: state.tvShows,
                        totalPages: realTotalPages,
                        onPreviousPage: () => _goToPreviousPage(context),
                        onNextPage: () => _goToNextPage(context, realTotalPages),
                      ),
                      if (state.isRefreshing)
                        Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            color: Colors.blue. withOpacity(0.3),
                            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                            child: Row(
                              mainAxisAlignment:  MainAxisAlignment.center,
                              children: [
                                const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2, valueColor: AlwaysStoppedAnimation(Colors.blue))),
                                const SizedBox(width: 8),
                                Text(AppLocalizations.of(context)!.updating, style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.w500)),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                );
              }
              if (state is PopularTVLoaded) {
                final realTotalPages = state.totalPages > 500 ? 500 : state.totalPages;
                return SliverToBoxAdapter(
                  child: ListPageWidget(
                    genres:  state.genreMap,
                    page: _currentPageIndex + 1,
                    tvShows: state.tvShows,
                    totalPages: realTotalPages,
                    onPreviousPage: () => _goToPreviousPage(context),
                    onNextPage: () => _goToNextPage(context, realTotalPages),
                  ),
                );
              }
              return const SliverFillRemaining(hasScrollBody:  false, child: Center(child:  Text('No data')));
            },
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:sillicon_power/presentation/pages/config_page.dart';
import 'package:sillicon_power/presentation/theme/language_provider.dart';
import '../../core/di/service_locator.dart';
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
  String? _prevLanguage; // Track previous language to reload

  @override
  void initState() {
    super.initState();
    _currentPageIndex = 0;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final languageCode = context.watch<LanguageProvider>().locale.languageCode;

    // Only reload if language changed
    if (_prevLanguage != languageCode) {
      _prevLanguage = languageCode;

      // Dispatch BLoC events for new language with current page
      final bloc = context.read<PopularTVBloc>();
      bloc.add(LoadTvShowInfo(languageCode));
      bloc.add(LoadPopularTVShows(_currentPageIndex + 1, languageCode));
    }
  }

  void _goToPreviousPage(BuildContext context) {
    if (_currentPageIndex > 0) {
      _currentPageIndex--;
      final languageCode = context.read<LanguageProvider>().locale.languageCode;
      context
          .read<PopularTVBloc>()
          .add(LoadPopularTVShows(_currentPageIndex + 1, languageCode));
    }
  }

  void _goToNextPage(BuildContext context, int totalPages) {
    if (_currentPageIndex < totalPages - 1) {
      _currentPageIndex++;
      final languageCode = context.read<LanguageProvider>().locale.languageCode;
      context
          .read<PopularTVBloc>()
          .add(LoadPopularTVShows(_currentPageIndex + 1, languageCode));
    }
  }

  @override
  Widget build(BuildContext context) {
    //final languageCode = context.watch<LanguageProvider>().locale.languageCode;
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
                  icon: const Icon(Icons.more_horiz),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ConfigPage()),
                  ),
                ),
              ],
            ),
            BlocBuilder<PopularTVBloc, PopularTVState>(
              builder: (context, state) {
                if (state is PopularTVLoading) {
                  return const SliverFillRemaining(
                    hasScrollBody: false,
                    child: Center(
                      child: CircularProgressIndicator(color: Colors.black,),
                    ),
                  );
                }

                if (state is PopularTVError) {
                  return SliverFillRemaining(
                    hasScrollBody: false,
                    child: Center(
                      child: Text(AppLocalizations.of(context)!.error),
                    ),
                  );
                }

                if (state is PopularTVLoaded) {
                  int realTotalPages = state.totalPages > 500 ? 500 : state.totalPages;

                  return SliverToBoxAdapter(
                    child: ListPageWidget(
                      genres: state.genreMap,
                      page: _currentPageIndex + 1,
                      tvShows: state.tvShows,
                      totalPages: realTotalPages,
                      onPreviousPage: () => _goToPreviousPage(context),
                      onNextPage: () =>
                          _goToNextPage(context, realTotalPages),
                    ),
                  );
                }

                return const SliverFillRemaining(
                  hasScrollBody: false,
                  child: Center(child: Text('No data')),
                );
              },
            ),
          ],
        ),
      );
  }
}

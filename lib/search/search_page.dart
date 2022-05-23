import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_repository/github_repository.dart';
import 'package:stargazersviewer/search/bloc/search_bloc.dart';
import 'package:stargazersviewer/utils/debounce.dart';

class SearchPage extends StatelessWidget {
  static Page page() {
    return const MaterialPage<void>(
      child: SearchPage(),
    );
  }

  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchBloc(context.read<GitHubRepository>()),
      child: _SearchView(),
    );
  }
}

class _SearchView extends StatelessWidget {
  final _debounce = Debounce(milliseconds: 500);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search')),
      body: BlocListener<SearchBloc, SearchState>(
        listener: (context, state) {
          if (state is SearchResultError) {}
        },
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Search user here',
                ),
                onChanged: (text) {
                  _debounce.run(() => _handleTextSearch(context, text));
                },
              ),
            ),
            BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                if (state is SearchResultSuccess) {
                  return Center(
                    child: Text(
                      'found ${state.usersFound.length} users',
                      style: const TextStyle(fontSize: 24.0),
                    ),
                  );
                } else {
                  return const Center(
                    child: Text('Insert text to start search'),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  void _handleTextSearch(BuildContext context, String text) {
    if (text.length > 2) {
      context.read<SearchBloc>().add(SearchEvent(text));
    }
  }
}

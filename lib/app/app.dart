import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_repository/github_repository.dart';
import 'package:stargazersviewer/bloc/stargazers_viewer_bloc.dart';
import 'package:stargazersviewer/repository/repository_page.dart';
import 'package:stargazersviewer/stargazers/stargazers_page.dart';

import '../search/search_page.dart';

class App extends StatelessWidget {
  final GitHubRepository gitHubRepository;

  const App({Key? key, required this.gitHubRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: gitHubRepository,
      child: BlocProvider(
        create: (_) => StargazersViewerBloc(),
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  List<Page> onGeneratePages(StargazersViewerState state, List<Page> pages) {
    final selectedUser = state.selectedUser;
    final selectedRepository = state.selectedRepository;
    return [
      SearchPage.page(),
      if (selectedUser != null) RepositoryPage.page(user: selectedUser),
      if (selectedUser != null && selectedRepository != null)
        StargazersPage.page(
          user: selectedUser,
          repository: selectedRepository,
        )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stargazers Viewer',
      home: FlowBuilder(
        state: context.watch<StargazersViewerBloc>().state,
        onGeneratePages: onGeneratePages,
      ),
    );
  }
}

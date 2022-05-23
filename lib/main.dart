import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_repository/github_repository.dart';
import 'package:stargazersviewer/bloc/stargazers_viewer_bloc.dart';
import 'package:stargazersviewer/stargazers_viewer_app.dart';
import 'package:stargazersviewer/stargazers_viewer_observer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  BlocOverrides.runZoned(
    () => runApp(
      MultiRepositoryProvider(
        providers: [
          RepositoryProvider<GitHubRepository>(
            create: (context) => GitHubRepositoryImp(
              service: GitHubServiceImp(),
              storage: GitHubStorageImp(),
            ),
          ),
        ],
        child: BlocProvider(
          create: (_) => StargazersViewerBloc(),
          child: const StargazersViewerApp(),
        ),
      ),
    ),
    blocObserver: StargazersViewerObserver(),
  );
}

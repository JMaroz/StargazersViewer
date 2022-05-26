import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_repository/github_repository.dart';
import 'package:stargazersviewer/app/app.dart';
import 'package:stargazersviewer/app/app_observer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final repository = GitHubRepositoryImp(
    service: GitHubServiceImp(),
    storage: GitHubStorageImp(),
  );

  BlocOverrides.runZoned(
    () => runApp(App(gitHubRepository: repository)),
    blocObserver: StargazersViewerObserver(),
  );
}

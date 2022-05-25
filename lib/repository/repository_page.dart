import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_repository/github_repository.dart';
import 'package:stargazersviewer/repository/bloc/repository_bloc.dart';
import 'package:stargazersviewer/repository/view/repository_view.dart';

class RepositoryPage extends StatelessWidget {
  static Page page({required GitHubUser user}) {
    return MaterialPage<void>(
      child: RepositoryPage(
        key: Key(user.login),
        user: user,
      ),
    );
  }

  final GitHubUser user;

  const RepositoryPage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RepositoryBloc(context.read<GitHubRepository>())
        ..add(RepositoryEvent(user)),
      child: RepositoryView(user: user),
    );
  }
}

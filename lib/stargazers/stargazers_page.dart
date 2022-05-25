import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_repository/github_repository.dart';
import 'package:stargazersviewer/stargazers/bloc/stargazers_bloc.dart';
import 'package:stargazersviewer/stargazers/view/stargazers_view.dart';

class StargazersPage extends StatelessWidget {
  static Page page({
    required GitHubUser user,
    required GitHubUserRepository repository,
  }) {
    return MaterialPage<void>(
      child: StargazersPage(
        key: Key(repository.fullName),
        user: user,
        repository: repository,
      ),
    );
  }

  final GitHubUser user;
  final GitHubUserRepository repository;

  const StargazersPage({
    Key? key,
    required this.user,
    required this.repository,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StargazersBloc(context.read<GitHubRepository>())
        ..add(StargazersEvent(user: user, repository: repository)),
      child: StargazersView(user: user, repository: repository),
    );
  }
}

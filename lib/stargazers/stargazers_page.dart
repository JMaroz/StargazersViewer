import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_repository/github_repository.dart';

class StargazersPage extends StatelessWidget {
  static Page page({
    required GitHubUser user,
    required GitHubUserRepository repository,
  }) {
    return MaterialPage<void>(
      child: StargazersPage(
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
    return const Scaffold(
      body: Center(
        child: Text("StargazersPage"),
      ),
    );
  }
}

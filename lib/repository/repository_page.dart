import 'package:flutter/material.dart';
import 'package:github_repository/github_repository.dart';

class RepositoryPage extends StatelessWidget {

  static Page page({required GitHubUser user}) {
    return MaterialPage<void>(
      child: RepositoryPage(user: user),
    );
  }

  final GitHubUser user;

  const RepositoryPage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("RepositoryPage"),
      ),
    );
  }
}

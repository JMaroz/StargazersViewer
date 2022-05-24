import 'package:flutter/material.dart';
import 'package:github_repository/github_repository.dart';
import 'package:stargazersviewer/repository/view/repository_item.dart';

class RepositoryList extends StatelessWidget {
  final GitHubUser user;
  final List<GitHubUserRepository> repositories;

  const RepositoryList({
    super.key,
    required this.user,
    required this.repositories,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: repositories.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: RepositoryItem(user: user, repository: repositories[index]),
      ),
    );
  }
}

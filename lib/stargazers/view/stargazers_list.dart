import 'package:flutter/material.dart';
import 'package:github_repository/github_repository.dart';
import 'package:stargazersviewer/stargazers/view/stargazers_item.dart';

class StargazersList extends StatelessWidget {
  final List<GitHubUser> users;

  const StargazersList({
    super.key,
    required this.users,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: users.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: StargazersItem(user: users[index]),
      ),
    );
  }
}

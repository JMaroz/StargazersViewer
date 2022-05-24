import 'package:flutter/material.dart';
import 'package:github_repository/github_repository.dart';

class StargazersItem extends StatelessWidget {
  final GitHubUser user;

  const StargazersItem({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 2.0,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(user.avatarUrl),
          ),
        ),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            decoration: const BoxDecoration(color: Colors.white30),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                user.login,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 22),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

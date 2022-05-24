import 'package:flutter/material.dart';
import 'package:github_repository/github_repository.dart';
import 'package:stargazersviewer/search/view/search_item.dart';

class SearchList extends StatelessWidget {
  final List<GitHubUser> users;

  const SearchList({super.key, required this.users});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: users.length,
      separatorBuilder: (context, index) => const Divider(color: Colors.black),
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: SearchItem(user: users[index]),
      ),
    );
  }
}

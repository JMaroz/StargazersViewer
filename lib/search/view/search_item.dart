import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_repository/github_repository.dart';
import 'package:stargazersviewer/bloc/stargazers_viewer_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class SearchItem extends StatelessWidget {
  final GitHubUser user;

  const SearchItem({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: GestureDetector(
        onTap: () {
          context.read<StargazersViewerBloc>().add(UserSelected(user: user));
        },
        child: Card(
          color: Colors.white,
          elevation: 2.0,
          child: Container(
            margin: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox.square(
                  child: user.avatarUrl.isNotEmpty
                      ? Image.network(user.avatarUrl)
                      : const Icon(Icons.face),
                ),
                const SizedBox(width: 10),
                Text(
                  user.login,
                  style: const TextStyle(fontSize: 22),
                ),
                const SizedBox(width: 10),
                if (user.htmlUrl.isNotEmpty) ...[
                  const Spacer(),
                  SizedBox.square(
                    dimension: 50,
                    child: IconButton(
                      icon: const Icon(Icons.open_in_new),
                      onPressed: _launchUrl,
                    ),
                  ),
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _launchUrl() async {
    final uri = Uri.parse(user.htmlUrl);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}

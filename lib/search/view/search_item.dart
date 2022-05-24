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
                      : Image.asset('images/avatar_placeholder.png'),
                ),
                const SizedBox(width: 10),
                Text(user.login),
                const SizedBox(width: 10),
                if (user.htmlUrl.isNotEmpty)
                  SizedBox.square(
                    dimension: 50,
                    child: IconButton(
                      icon: Image.asset('images/open.png'),
                      onPressed: _launchUrl,
                    ),
                  )
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

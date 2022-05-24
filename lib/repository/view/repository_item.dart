import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_repository/github_repository.dart';
import 'package:stargazersviewer/bloc/stargazers_viewer_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class RepositoryItem extends StatelessWidget {
  final GitHubUser user;
  final GitHubUserRepository repository;

  const RepositoryItem(
      {super.key, required this.user, required this.repository});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<StargazersViewerBloc>().add(
              RepositorySelected(
                user: user,
                repository: repository,
              ),
            );
      },
      child: Card(
        color: Colors.white,
        elevation: 2.0,
        child: Container(
          margin: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: RichText(
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                        text: repository.name,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                  SizedBox.square(
                    dimension: 40,
                    child: IconButton(
                      icon: const Icon(Icons.open_in_new),
                      onPressed: _launchUrl,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 10),
              Text(repository.description),
            ],
          ),
        ),
      ),
    );
  }

  void _launchUrl() async {
    final uri = Uri.parse(repository.htmlUrl);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}

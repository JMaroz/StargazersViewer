import 'package:equatable/equatable.dart';
import 'package:github_apis/github_apis.dart';

class GitHubUserRepository extends Equatable {
  final int id;
  final String name;
  final String fullName;
  final String htmlUrl;
  final String description;
  final int stargazersCount;
  final int watchersCount;

  const GitHubUserRepository({
    required this.id,
    required this.name,
    required this.fullName,
    required this.htmlUrl,
    required this.description,
    required this.stargazersCount,
    required this.watchersCount,
  });

  factory GitHubUserRepository.fromRepository(Repository repository) =>
      GitHubUserRepository(
        id: repository.id ?? 0,
        name: repository.name ?? "",
        fullName: repository.fullName ?? "",
        htmlUrl: repository.htmlUrl ?? "",
        description: repository.description ?? "",
        stargazersCount:  repository.stargazersCount ?? 0,
        watchersCount: repository.watchers ?? 0
      );

  @override
  List<Object?> get props => [id, name, fullName, htmlUrl, description];
}

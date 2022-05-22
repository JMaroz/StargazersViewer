import 'package:equatable/equatable.dart';
import 'package:github_apis/github_apis.dart';

///Class that represent ad User on GitHub
class GitHubUser extends Equatable {
  final String login;
  final int id;
  final String avatarUrl;
  final String htmlUrl;

  const GitHubUser({
    required this.login,
    required this.id,
    required this.avatarUrl,
    required this.htmlUrl,
  });

  factory GitHubUser.fromUserApi(User user) => GitHubUser(
        login: user.login ?? "",
        id: user.id ?? 0,
        avatarUrl: user.avatarUrl ?? "",
        htmlUrl: user.htmlUrl ?? "",
      );

  @override
  List<Object?> get props => [login, id, avatarUrl, htmlUrl];
}

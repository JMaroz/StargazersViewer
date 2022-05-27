import 'package:github_repository/github_repository.dart';
import 'package:github_repository/src/utils/result.dart';
import 'package:tuple/tuple.dart';

class GitHubRepositoryTestImp implements GitHubRepository {
  @override
  Future<Result<List<GitHubUserRepository>>> getRepositories(String userName) =>
      Future.value(Result.success([
        const GitHubUserRepository(
          id: 1,
          name: "RoundButton",
          fullName: "JMaroz/RoundButton",
          htmlUrl: "https://github.com/",
          description: "An android library",
          stargazersCount: 20,
          watchersCount: 10,
        )
      ]));

  @override
  Future<Result<List<GitHubUser>>> getStargazers(
    String userName,
    String repositoryName,
  ) =>
      Future.value(Result.success([
        const GitHubUser(
          login: "Simone",
          id: 1,
          avatarUrl: "",
          htmlUrl: "",
        )
      ]));

  @override
  Future<Result<Tuple2<List<GitHubUser>, bool>>> searchUser(String query) =>
      Future.value(Result.success(const Tuple2([
        GitHubUser(
          login: "JMaroz",
          id: 1,
          avatarUrl: "",
          htmlUrl: "",
        )
      ], false)));
}

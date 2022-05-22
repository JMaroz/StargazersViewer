import 'package:github_apis/github_apis.dart';
import 'package:github_repository/src/local/github_storage.dart';
import 'package:github_repository/src/local/model/github_user_repository.dart';
import 'package:github_repository/src/local/model/github_user.dart';
import 'package:github_repository/src/remote/github_service.dart';
import 'package:github_repository/src/utils/api_response.dart';
import 'package:github_repository/src/utils/network_bound_result.dart';
import 'package:github_repository/src/utils/result.dart';
import 'package:tuple/tuple.dart';

abstract class GitHubRepository {
  final GitHubService service;
  final GitHubStorage storage;

  GitHubRepository({
    required this.service,
    required this.storage,
  });

  ///Search the user that match with the given query
  ///[return] Tuple2, first is the users matched, the second is bool indicate if more data are available
  Future<Result<Tuple2<List<GitHubUser>, bool>>> searchUser(String query);

  ///Get the repositories of the given userName
  Future<Result<List<GitHubUserRepository>>> getRepositories(String userName);

  ///Get the user that has put a star in the repository of the given user
  Future<Result<List<GitHubUser>>> getStargazers(
      String userName, String repositoryName);
}

class GitHubRepositoryImp implements GitHubRepository {
  final GitHubService service;
  final GitHubStorage storage;

  GitHubRepositoryImp({
    required this.service,
    required this.storage,
  });

  Future<Result<Tuple2<List<GitHubUser>, bool>>> searchUser(String query) =>
      _SearchUserBound(service: service, storage: storage, query: query)
          .getResult(true);

  Future<Result<List<GitHubUserRepository>>> getRepositories(String userName) =>
      _GetRepositories(
        service: service,
        storage: storage,
        userName: userName,
      ).getResult();

  Future<Result<List<GitHubUser>>> getStargazers(
          String userName, String repositoryName) =>
      _GetStargazers(
        service: service,
        storage: storage,
        userName: userName,
        repositoryName: repositoryName,
      ).getResult();
}

class _SearchUserBound
    extends NetworkBoundResult<Tuple2<List<GitHubUser>, bool>, SearchResponse> {
  final GitHubService service;
  final GitHubStorage storage;
  final String query;

  List<GitHubUser>? _usersFound;
  bool _hasMoreData = false;

  _SearchUserBound({
    required this.service,
    required this.storage,
    required this.query,
  });

  @override
  Future<ApiResponse<SearchResponse>> fetchFromNetwork() =>
      service.searchUsers(query);

  @override
  Future<Tuple2<List<GitHubUser>, bool>?> loadFromDatabase() =>
      _usersFound == null
          ? Future.value(null)
          : Future.value(Tuple2(_usersFound!, _hasMoreData));

  @override
  void saveNetworkResult(SearchResponse item) {
    _usersFound = item.items?.map((e) => GitHubUser.fromUserApi(e)).toList();
    _hasMoreData = item.incompleteResults ?? false;
  }

  @override
  bool shouldFetch(Tuple2<List<GitHubUser>, bool>? data) => data == null;
}

class _GetRepositories
    extends NetworkBoundResult<List<GitHubUserRepository>, List<Repository>> {
  final GitHubService service;
  final GitHubStorage storage;
  final String userName;

  _GetRepositories({
    required this.service,
    required this.storage,
    required this.userName,
  });

  @override
  Future<ApiResponse<List<Repository>>> fetchFromNetwork() =>
      service.getRepositories(userName);

  @override
  Future<List<GitHubUserRepository>?> loadFromDatabase() =>
      storage.getRepositories(userName);

  @override
  void saveNetworkResult(List<Repository> item) {
    storage.saveRepositories(
        userName, item.map((e) => GitHubUserRepository.fromRepository(e)).toList());
  }

  @override
  bool shouldFetch(List<GitHubUserRepository>? data) => data == null;
}

class _GetStargazers extends NetworkBoundResult<List<GitHubUser>, List<User>> {
  final GitHubService service;
  final GitHubStorage storage;
  final String userName;
  final String repositoryName;

  _GetStargazers({
    required this.service,
    required this.storage,
    required this.userName,
    required this.repositoryName,
  });

  @override
  Future<ApiResponse<List<User>>> fetchFromNetwork() =>
      service.getStargazers(userName, repositoryName);

  @override
  Future<List<GitHubUser>?> loadFromDatabase() =>
      storage.getStargazers(userName, repositoryName);

  @override
  void saveNetworkResult(List<User> item) {
    storage.saveStargazers(userName, repositoryName,
        item.map((e) => GitHubUser.fromUserApi(e)).toList());
  }

  @override
  bool shouldFetch(List<GitHubUser>? data) => data == null;
}

import 'package:github_repository/src/local/model/github_user_repository.dart';
import 'package:github_repository/src/local/model/github_user.dart';

abstract class GitHubStorage {
  Future<List<GitHubUserRepository>?> getRepositories(String userName);

  void saveRepositories(String userName, List<GitHubUserRepository> repositories);

  Future<List<GitHubUser>?> getStargazers(
      String userName, String repositoryName);

  void saveStargazers(
      String userName, String repositoryName, List<GitHubUser> stargazers);
}

class GitHubStorageImp implements GitHubStorage {
  static final Map<Type, Map<String, dynamic>> _cache = {};

  void _cacheEntity<T>(String key, T entity) {
    _cache.putIfAbsent(T, () => {})[key] = entity;
  }

  T? _getCachedEntity<T>(String key) {
    final cache = _cache[T];
    if (cache != null) return cache[key];
    return null;
  }

  @override
  Future<List<GitHubUserRepository>?> getRepositories(String userName) =>
      Future.value(_getCachedEntity(userName));

  @override
  void saveRepositories(String userName, List<GitHubUserRepository> repositories) =>
      _cacheEntity(userName, repositories);

  @override
  Future<List<GitHubUser>?> getStargazers(
          String userName, String repositoryName) =>
      Future.value(_getCachedEntity("${userName}_$repositoryName"));

  @override
  void saveStargazers(String userName, String repositoryName,
          List<GitHubUser> stargazers) =>
      _cacheEntity("${userName}_$repositoryName", stargazers);
}

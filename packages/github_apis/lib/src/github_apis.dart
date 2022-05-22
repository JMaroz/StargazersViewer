import 'package:dio/dio.dart';
import 'package:github_apis/github_apis.dart';
import 'package:github_apis/src/entities/models.dart';
import 'package:retrofit/retrofit.dart';

part 'github_apis.g.dart';

abstract class GitHubApis {
  /// Search user in github
  /// [query] text to search
  /// [return] the response with the list of matching users and if has more users to fetch
  Future<SearchResponse> searchUsers(String query);

  /// Fetch the repositories of the user
  /// [userName] the user name of the owner of the repositories
  /// [return] the list of the repositories associated to the user
  Future<List<Repository>> getRepositories(String userName);

  /// Fetch the user that has put a Star in the repository of the user
  /// [userName] user name of the owner of the repository
  /// [repositoryName] the name of the repository
  /// [return] the list of the user that has stargazers the repo
  Future<List<User>> getStargazers(String userName, String repositoryName);
}

@RestApi(baseUrl: "https://api.github.com/")
abstract class GitHubApisImp implements GitHubApis {
  factory GitHubApisImp(Dio dio, {String baseUrl}) = _GitHubApisImp;

  @GET("users/{userName}/repos")
  @override
  Future<List<Repository>> getRepositories(@Path("userName") String userName);

  @GET("repos/{userName}/{repositoryName}/stargazers")
  @override
  Future<List<User>> getStargazers(
      @Path("userName") String userName,
      @Path("repositoryName") String repositoryName,
      );

  @GET("/search/users")
  @override
  Future<SearchResponse> searchUsers(@Query("q") String query);
}

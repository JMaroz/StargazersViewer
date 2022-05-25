import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:github_apis/github_apis.dart';
import 'package:github_repository/src/utils/api_response.dart';

abstract class GitHubService {

  Future<ApiResponse<SearchResponse>> searchUsers(String query);

  Future<ApiResponse<List<Repository>>> getRepositories(String userName);

  Future<ApiResponse<List<User>>> getStargazers(String userName, String repositoryName);

}

class GitHubServiceImp implements GitHubService {

  final GitHubApis _client = GitHubApisImp(Dio());

  @override
  Future<ApiResponse<SearchResponse>> searchUsers(String query) async {
    try {
      final response = await _client.searchUsers(query);
      return ApiResponse(data: response);
    } on Exception catch (ex, e) {
      if (kDebugMode) {
        print(e);
      }
      return ApiResponse(data: null, errorMessage: ex.toString(), exception: ex);
    }
  }

  @override
  Future<ApiResponse<List<Repository>>> getRepositories(String userName) async {
    try {
      final response = await _client.getRepositories(userName);
      return ApiResponse(data: response);
    } on Exception catch (ex, e) {
      if (kDebugMode) {
        print(e);
      }
      return ApiResponse(data: null, errorMessage: ex.toString(), exception: ex);
    }
  }

  @override
  Future<ApiResponse<List<User>>> getStargazers(String userName, String repositoryName) async {
    try {
      final response = await _client.getStargazers(userName, repositoryName);
      return ApiResponse(data: response);
    } on Exception catch (ex, e) {
      if (kDebugMode) {
        print(e);
      }
      return ApiResponse(data: null, errorMessage: ex.toString(), exception: ex);
    }
  }

}
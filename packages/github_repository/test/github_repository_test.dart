import 'package:dio/dio.dart';
import 'package:github_apis/src/github_apis.dart';
import 'package:github_repository/src/github_repository.dart';
import 'package:github_repository/src/local/github_storage.dart';
import 'package:github_repository/src/local/model/github_user_repository.dart';
import 'package:github_repository/src/remote/github_service.dart';
import 'package:test/test.dart';


late GitHubRepository _repository;

void main() {
  setUp(() async {
    _repository = GitHubRepositoryImp(service: GitHubServiceImp(), storage: GitHubStorageImp());
  });

  test("test search user", () async {
    final searchResponse = await _repository.searchUser("JMaroz");
    expect(searchResponse, isNotNull);
    expect(searchResponse.getOrNull(), isNotNull);
    expect(searchResponse.getOrNull()!.item1.length, greaterThanOrEqualTo(1));
  });

  test("test user repository", () async {
    final response = await _repository.getRepositories("JMaroz");
    expect(response, isNotNull);
    expect(response.getOrNull(), isNotNull);
    expect(response.getOrNull()!.length, greaterThanOrEqualTo(1));
  });

  test("test user stargazers", () async {
    final response = await _repository.getStargazers("JMaroz", "RoundButton");
    expect(response, isNotNull);
    expect(response.getOrNull(), isNotNull);
    expect(response.getOrNull()!.length, greaterThanOrEqualTo(1));
  });
}

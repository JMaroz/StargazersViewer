import 'package:dio/dio.dart';
import 'package:github_repository/src/github_apis.dart';
import 'package:test/test.dart';


late GitHubApis _client;
//Useful if we want to create a mock server with our response (es login and other endpoint)
// late MockWebServer _server;
// final _headers = {"Content-Type": "application/json"};
// final dispatcherMap = <String, MockResponse>{};

void main() {
  // setUp(() async {
  //   _server = MockWebServer();
  //   // _server.dispatcher = (HttpRequest request) async {
  //   //   var res = dispatcherMap[request.uri.path];
  //   //   if (res != null) {
  //   //     return res;
  //   //   }
  //   //   return new MockResponse()..httpCode = 404;
  //   // };
  //   await _server.start();
  //   final dio = Dio();
  //   dio.interceptors.add(LogInterceptor(responseBody: true));
  //   dio.interceptors.add(DateTimeInterceptor());
  //   _client = GitHubApisImp(dio, baseUrl: _server.url);
  // });
  //
  // tearDown(() {
  //   _server.shutdown();
  // });

  setUp(() async {
    final dio = Dio();
    dio.interceptors.add(LogInterceptor(responseBody: true));
    _client = GitHubApisImp(dio);
  });

  test("test search user", () async {
    final searchResponse = await _client.searchUsers("JMaroz");
    expect(searchResponse, isNotNull);
    expect(searchResponse.items?.length, 2);
  });

  test("test user repository", () async {
    final response = await _client.getRepositories("JMaroz");
    expect(response, isNotNull);
    expect(response.length, greaterThan(1));
  });

  test("test user stargazers", () async {
    final response = await _client.getStargazers("JMaroz", "RoundButton");
    expect(response, isNotNull);
    expect(response.length, greaterThan(1));
  });
}

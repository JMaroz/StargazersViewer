// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_repository/github_repository.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stargazersviewer/app/app.dart';

import 'utils.dart';

void main() {
  group('StargazerView', () {
    late GitHubRepository gitHubRepository;

    setUp(() {
      gitHubRepository = GitHubRepositoryTestImp();
    });

    testWidgets('renders StargazerView', (tester) async {
      await tester.pumpWidget(
        App(gitHubRepository: gitHubRepository),
      );
      expect(find.byType(AppView), findsOneWidget);

      // Enter 'hi' into the TextField.
      await tester.enterText(find.byType(TextField), 'JMaroz');

      await tester.pumpAndSettle(const Duration(seconds: 1));
    });
  });
}

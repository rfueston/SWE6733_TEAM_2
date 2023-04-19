import 'package:adventurequest/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Login Page Smoke Test: testLogInPageScreen',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyAdventureQuestLogin());

    // Verify that text starts on Login page
    expect(find.text('SIGN IN'), findsOneWidget);
  });

  testWidgets('Login Page Smoke Test: testLogInPageScreenCreate',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyAdventureQuestLogin());

    // Verify that text on Login page
    expect(find.text('CREATE ACCOUNT'), findsOneWidget);
  });

  testWidgets('Login Page Smoke Test: testLogInPageNavSignIn',
          (WidgetTester tester) async {
        // Build our app and trigger a frame.
        await tester.pumpWidget(const MyAdventureQuestLogin());

        // Verify that text on Login page
        expect(find.text('SIGN IN'), findsOneWidget);

        // Tap icon for navigation to verify it is present
        await tester.tap(find.byKey(Key('signinbuttonlogin')));
        await tester.pump();
      });


  testWidgets('Login Page Smoke Test: testLogInPageNavCreateAccount',
          (WidgetTester tester) async {
        // Build our app and trigger a frame.
        await tester.pumpWidget(const MyAdventureQuestLogin());

        // Verify that text on Login page
        expect(find.text('SIGN IN'), findsOneWidget);

        // Tap icon for navigation to verify it is present
        await tester.tap(find.byKey(Key('createbuttonlogin')));
        await tester.pump();
      });
}

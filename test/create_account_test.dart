import 'package:adventurequest/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('create account Smoke Test: testCreateAccountScreen',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyAdventureQuestAccountPage());

    // Verify that text starts on create account page
    expect(find.text('Create Account'), findsOneWidget);
  });

  testWidgets('create account Smoke Test: testCreateAccountText',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.

    await tester.pumpWidget(const MyAdventureQuestAccountPage());

    // Verify that text starts on create account page
    expect(find.text('Create Account'), findsOneWidget);

    // enter text
    await tester.enterText(find.byKey(Key('createaccountfirstname')), 'richard');
    await tester.pump();
    await tester.enterText(find.byKey(Key('createaccountlastname')), 'fueston');
    await tester.pump();
    await tester.enterText(find.byKey(Key('createaccountusername')), 'rfueston');
    await tester.pump();
    await tester.enterText(find.byKey(Key('createaccountpassword')), 'test1');
    await tester.pump();
    await tester.enterText(find.byKey(Key('createaccountrepeat')), 'test1');
    await tester.pump();
    await tester.enterText(find.byKey(Key('createaccountemail')), 'rfueston@gmail.com');
    await tester.pump();

    expect(find.byKey(Key('createbuttonAccount')), findsOneWidget);
  });

  // TODO: Implement mock firebase (mockito)
  // testWidgets('create account Smoke Test: testCreateAccountNeg', (WidgetTester tester) async {
  //   // Build our app and trigger a frame.
  //   await tester.pumpWidget(const MyAdventureQuestAccountPage());
  // });
}

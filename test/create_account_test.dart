import 'package:adventurequest/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('create account Smoke Test: testCreateAccountScreenTitle',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyAdventureQuestAccountPage());

    // Verify that text starts on create account page
    expect(find.text('AdventureQuest'), findsOneWidget);
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

  testWidgets('create account Smoke Test: testAccountCreationCreateButton', (WidgetTester tester) async {

      // Build our app and trigger a frame.
      await tester.pumpWidget(const MyAdventureQuestAccountPage());

      // Verify that text starts on create account page
      expect(find.text('Create Account'), findsOneWidget);
  });

  testWidgets(
      'Create Account Smoke Test: testCreateAccountWithToManyCharacters', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyAdventureQuestAccountPage());

    // enter text
    await tester.enterText(find.byKey(Key('createaccountfirstname')), 'abcdefghijklmnopqrstuvwxyz');
    await tester.pump();

    expect(find.text('abcdefghijklmnopqrstuvwxyz'), findsNothing);
    expect(find.text('abcdefghijklmnopqrst'), findsOneWidget);
  });

  testWidgets(
      'Create Account Smoke Test: testCreateAccountNotObscured', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyAdventureQuestAccountPage());

    expect((tester.firstWidget(find.byType(TextField)) as TextField).obscureText, false);
  });

  testWidgets('Create Account Smoke Test: testCreateAccountWithspecialchar', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyAdventureQuestAccountPage());
    // enter text
    await tester.enterText(find.byKey(Key('createaccountfirstname')), '@#@###@%@%');
    await tester.pump();

    expect(find.text('@#@###@%@%'), findsOneWidget);
  });

  testWidgets(
      'Create Account Smoke Test: testCreateAccountEmail', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyAdventureQuestAccountPage());

    final gesture = await tester.startGesture(Offset(0, 300));
    await gesture.moveBy(Offset(0, -300));

    // enter text
    await tester.enterText(find.byKey(Key('createaccountemail')), 'rfueston@gmail.com');
    await tester.pump();
  });

  testWidgets(
      'Create Account Smoke Test: testCreateAccountRepeat', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyAdventureQuestAccountPage());

    final gesture = await tester.startGesture(Offset(0, 300));
    await gesture.moveBy(Offset(0, -300));

    // enter text
    await tester.enterText(find.byKey(Key('createaccountrepeat')), 'test12');
    await tester.pump();
  });

  testWidgets(
      'Create Account Smoke Test: testCreateAccountlast', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyAdventureQuestAccountPage());
    // enter text
    await tester.enterText(find.byKey(Key('createaccountlastname')), 'test');
    await tester.pump();
  });

  testWidgets(
      'Create Account Smoke Test: testCreateAccountUser', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyAdventureQuestAccountPage());
    // enter text
    await tester.enterText(find.byKey(Key('createaccountusername')), 'rfueston@gmail.com');
    await tester.pump();
  });
}

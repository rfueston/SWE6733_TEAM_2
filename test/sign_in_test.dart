import 'package:adventurequest/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_core/firebase_core.dart';



void main() async{

  testWidgets('Sign In Smoke Test: testSignInScreen', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyAdventureQuestSignIn());

    // Verify that text starts on sign in page
    expect(find.text('Welcome To AdventureQuest'), findsOneWidget);

  });

  testWidgets('Login Smoke Test: testSignInWithAccount', (WidgetTester tester) async {
    // Build our app and trigger a frame.

    await tester.pumpWidget(const MyAdventureQuestSignIn());


    // Verify that text starts on sign in page
    expect(find.text('Welcome To AdventureQuest'), findsOneWidget);

    // enter text
    await tester.enterText(find.byKey(Key('signinusername')), 'rfueston');
    await tester.pump();
    await tester.enterText(find.byKey(Key('signinpassword')), 'test1');
    await tester.pump();

    expect(find.byKey(Key('signinbutton')), findsOneWidget);

  });

  // TODO: Implement mock firebase (mockito)
  // testWidgets('Login Smoke Test: testSignInWithAccountNeg', (WidgetTester tester) async {
  //   // Build our app and trigger a frame.
  //   await tester.pumpWidget(const MyAdventureQuestSignIn());
  //
  //   // Verify that text starts on sign in page
  //   expect(find.text('Welcome To AdventureQuest'), findsOneWidget);
  //
  //   // enter text
  //   await tester.enterText(find.byKey(Key('siginusername')), 'rfueston');
  //   await tester.pump();
  //   await tester.enterText(find.byKey(Key('siginpassword')), 'test11');
  //   await tester.pump();
  //
  //   await tester.tap(find.byKey(Key('siginbutton')));
  //   await tester.pump();
  // });
}

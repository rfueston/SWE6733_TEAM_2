import 'package:adventurequest/main.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import './mock.dart';


void main() {
  setupFirebaseAuthMocks();
  setUpAll(() async {
    await Firebase.initializeApp();
  });
  testWidgets('Home Page Smoke Test: testHomePageScreen', (WidgetTester tester) async {

    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyAdventureQuestHome());

    // Verify that text starts on home page
    expect(find.text('Discover Adventure'), findsOneWidget);
  });

  testWidgets('Home Page Smoke Test: testHomePageNavMatches', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyAdventureQuestHome());

    // Verify that text on home page
    expect(find.text('Discover Adventure'), findsOneWidget);


    // Tap icon for navigation to verify it is present
    await tester.tap(find.byIcon(Icons.travel_explore_outlined));
    await tester.pump();

    // Verify that text on home page
    expect(find.text('Matching Users'), findsOneWidget);
  });

  testWidgets('Home Page Smoke Test: testHomePageNavlikes', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyAdventureQuestHome());

    // Verify that text on home page
    expect(find.text('Discover Adventure'), findsOneWidget);


    // Tap icon for navigation to verify it is present
    await tester.tap(find.byIcon(Icons.favorite_outlined));
    await tester.pump();

    // Verify that text on home page
    expect(find.text('Liked profiles will be displayed here'), findsOneWidget);
  });

  testWidgets('Home Page Smoke Test: testHomePageNavUser', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyAdventureQuestHome());

    // Verify that text on home page
    expect(find.text('Discover Adventure'), findsOneWidget);


    // Tap icon for navigation to verify it is present
    await tester.tap(find.byIcon(Icons.person_outlined));
    await tester.pump();

    // Verify that text starts on home page
    expect(find.text('Bio Section'), findsOneWidget);
  });
}

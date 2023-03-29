import 'package:adventurequest/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  testWidgets('Home Page Smoke Test: testHomePageScreen', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyAdventureQuestHome());

    // Verify that text starts on home page
    expect(find.text('Discover Adventure'), findsOneWidget);

  });

  testWidgets('Home Page Smoke Test: testHomePageNavProfiles', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyAdventureQuestHome());

    // Verify that text on home page
    expect(find.text('Discover Adventure'), findsOneWidget);


    // Tap icon for navigation to verify it is present
    await tester.tap(find.byIcon(Icons.travel_explore_outlined));
    await tester.pump();

    // Verify that text on home page
    expect(find.text('Profiles will be displayed here'), findsOneWidget);
  });

  testWidgets('Home Page Smoke Test: testHomePageNavMatches', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyAdventureQuestHome());

    // Verify that text on home page
    expect(find.text('Discover Adventure'), findsOneWidget);


    // Tap icon for navigation to verify it is present
    await tester.tap(find.byIcon(Icons.favorite_outlined));
    await tester.pump();

    // Verify that text on home page
    expect(find.text('Matches will be displayed here'), findsOneWidget);
  });

  testWidgets('Home Page Smoke Test: testHomePageNavChats', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyAdventureQuestHome());

    // Verify that text on home page
    expect(find.text('Discover Adventure'), findsOneWidget);


    // Tap icon for navigation to verify it is present
    await tester.tap(find.byIcon(Icons.chat_bubble_outline_outlined));
    await tester.pump();

    // Verify that text on home page
    expect(find.text('Chats will be displayed here'), findsOneWidget);
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
    expect(find.text('User profile will be displayed here'), findsOneWidget);
  });
}

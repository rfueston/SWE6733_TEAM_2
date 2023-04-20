import 'package:adventurequest/main.dart';
//import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
//import 'package:firebase_core/firebase_core.dart';



void main() async {
  testWidgets('Adventure Rating Smoke Test: testAdventureRatingScreen', (
      WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyAdventureQuestRatings());

    // Verify that text starts on sign in page
    expect(find.text('Activity: biking'), findsOneWidget);
  });

  testWidgets('Adventure Rating Smoke Test: testAdventureRatingScreen', (
      WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyAdventureQuestRatings());

    // Verify that text starts on sign in page
    expect(find.text('Do you like biking?'), findsOneWidget);
  });

  testWidgets('Adventure Rating Smoke Test: testAdventureRatingScreen', (
      WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyAdventureQuestRatings());

    // Verify that text starts on sign in page
    expect(find.text('Activity: hiking'), findsOneWidget);
  });

  testWidgets('Adventure Rating Smoke Test: testAdventureRatingScreen', (
      WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyAdventureQuestRatings());

    // Verify that text starts on sign in page
    expect(find.text('Do you like hiking?'), findsOneWidget);
  });

  testWidgets('Adventure Rating Smoke Test: testAdventureRatingScreen', (
      WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyAdventureQuestRatings());

    // Verify that text starts on sign in page
    expect(find.text('Activity: running'), findsOneWidget);
  });

  testWidgets('Adventure Rating Smoke Test: testAdventureRatingScreen', (
      WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyAdventureQuestRatings());

    // Verify that text starts on sign in page
    expect(find.text('Do you like running?'), findsOneWidget);
  });
}

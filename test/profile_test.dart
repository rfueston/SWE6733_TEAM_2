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
  testWidgets('Home Page Smoke Test: testHomePageNavLocationSettings', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyAdventureQuestHome());

    // Verify that text on home page
    expect(find.text('Discover Adventure'), findsOneWidget);

    // Tap icon for navigation to verify it is present
    await tester.tap(find.byIcon(Icons.person_outlined));
    await tester.pump();

    final listFinder = find.byType(Scrollable);
    final itemFinder = find.text('Activity Settings');

    final gesture = await tester.startGesture(Offset(0, 300)); //Position of the scrollview
    await gesture.moveBy(Offset(0, -300)); //How much to scroll by
    await tester.pump();

    // Tap if present
    await tester.tap(find.byKey(Key('profilelocation')));
    await tester.pump();
  });

  testWidgets('Home Page Smoke Test: testHomePageNavActivitySettings', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyAdventureQuestHome());

    // Verify that text on home page
    expect(find.text('Discover Adventure'), findsOneWidget);

    // Tap icon for navigation to verify it is present
    await tester.tap(find.byIcon(Icons.person_outlined));
    await tester.pump();

    final gesture = await tester.startGesture(Offset(0, 300)); //Position of the scrollview
    await gesture.moveBy(Offset(0, -300)); //How much to scroll by
    await tester.pump();

    // Verify that text starts on home page
    expect(find.byKey(Key('activitybiking')), findsOneWidget);
    expect(find.byKey(Key('activityrunning')), findsOneWidget);
    expect(find.byKey(Key('activityhiking')), findsOneWidget);
  });

  testWidgets('Home Page Smoke Test: testHomePageNavEmailProfile', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyAdventureQuestHome());

    // Verify that text on home page
    expect(find.text('Discover Adventure'), findsOneWidget);


    // Tap icon for navigation to verify it is present
    await tester.tap(find.byIcon(Icons.person_outlined));
    await tester.pump();

    // Verify that text ca be entered
    await tester.enterText(find.byKey(Key('profileemail')), 'rfueston@gmail.com');
    await tester.pump();
  });

  testWidgets('Home Page Smoke Test: testHomePageNavMyBioTextField', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyAdventureQuestHome());

    // Verify that text on home page
    expect(find.text('Discover Adventure'), findsOneWidget);


    // Tap icon for navigation to verify it is present
    await tester.tap(find.byIcon(Icons.person_outlined));
    await tester.pump();

    // Verify that text ca be entered
    await tester.enterText(find.byKey(Key('profilebio')), 'Hi');
    await tester.pump();
  });
}
import 'package:adventurequest/main.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  testWidgets('Home Page Smoke Test: testHomePageNavChatBox', (
      WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyAdventureQuestHome());

    // Verify that text on home page
    expect(find.text('Discover Adventure'), findsOneWidget);


    // Tap icon for navigation to verify it is present
    await tester.tap(find.byIcon(Icons.chat_bubble_outline_outlined));
    await tester.pump();

    // Verify that text
    await tester.enterText(find.byKey(Key('chattext')), 'Hi');
    await tester.pump();
  });
}
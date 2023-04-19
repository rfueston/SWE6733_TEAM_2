import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'home_page.dart';
import 'main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MatchRunPage extends StatefulWidget {
  const MatchRunPage({super.key});

  @override
  State<MatchRunPage> createState() => _MyMatchRunPage();
}

class _MyMatchRunPage extends State<MatchRunPage> {
  Future<void> _addMatchedUser() async {
    //logic to add matched user to friends list
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Please select one of your matches!'),
            Container(
              child: Row(
                children: [
                  Radio(
                      value: "Richard",
                      groupValue: "matched",
                      onChanged: (value) {
                        print(value); //selected value
                      }),
                  const Text("Richard, is rick"),
                ],
              ),
            ),
            Container(
              child: Row(
                children: [
                  Radio(
                      value: "Talia",
                      groupValue: "matched",
                      onChanged: (value) {
                        print(value); //selected value
                      }),
                  const Text(
                      "Talia, talia loves to hike her rating for hiking is 5! she lives near by!"),
                ],
              ),
            ),
            Container(
              child: Row(
                children: [
                  Radio(
                      value: "Scott",
                      groupValue: "matched",
                      onChanged: (value) {
                        print(value); //selected value
                      }),
                  const Text("Scott, scott loves to fish"),
                ],
              ),
            ),
            ElevatedButton(
              key: Key('addMatch'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(300, 60),
                maximumSize: const Size(300, 60),
              ),
              onPressed: _addMatchedUser,
              child: const Text('ADD'),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'home_page.dart';
import 'main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MatchBikePage extends StatefulWidget {
  const MatchBikePage({super.key});

  @override
  State<MatchBikePage> createState() => _MyMatchBikePage();
}

class _MyMatchBikePage extends State<MatchBikePage> {
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
                  const Text("Rich, is richard"),
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
                      "Talia"),
                ],
              ),
            ),
            ElevatedButton(
              key: Key('addMatch'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(150, 60),
                maximumSize: const Size(150, 60),
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
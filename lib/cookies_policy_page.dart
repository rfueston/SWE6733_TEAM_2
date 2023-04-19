import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'main.dart';

class CookiesPolicyPage extends StatefulWidget {
  const CookiesPolicyPage({super.key});

  @override
  State<CookiesPolicyPage> createState() => _MyCookiesPolicyPageState();
}

class _MyCookiesPolicyPageState extends State<CookiesPolicyPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AdventureQuest"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
             Text(
              'Cookies Policy Page',
              textAlign: TextAlign.start,
            ),
          ],
        ),
      ),
    );
  }
}

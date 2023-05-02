import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'main.dart';
import 'create_account.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'message.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'message_page.dart';

class MessageSearchPage extends StatefulWidget {
  const MessageSearchPage({super.key});

  @override
  State<MessageSearchPage> createState() => _MyMessageSearchPageState();
}

class _MyMessageSearchPageState extends State<MessageSearchPage> {

  final userMsgController = TextEditingController();

  @override
  void dispose() {
    userMsgController.dispose();
    super.dispose();
  }

  void _searchMyUser() {

    // var test = userMsgController;
    //
    // MessagePage().getUserMessagerName(test);

    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MessagePage()),
      );
    });
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
            SizedBox(
              width: 350.0,
              height: 100,
              child: TextField(
                key: Key('searchtext'),
                controller: userMsgController,
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Search for User',
                ),
              ),
            ),
            ElevatedButton(
              key: Key('searchbutton'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(250, 50),
                maximumSize: const Size(250, 50),
              ),
              onPressed: _searchMyUser,
              child: const Text('SEARCH'),
            ),
          ],
        ),
      ),
    );
  }
}
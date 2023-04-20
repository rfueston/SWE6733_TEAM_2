import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'create_account.dart';

class MsgPage extends StatefulWidget {
  const MsgPage({super.key});

  @override
  State<MsgPage> createState() => _MyMsgPageState();
}

class _MyMsgPageState extends State<MsgPage> {
  final myControllerText = TextEditingController();

  //used for profile image
  // final imageURL = "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg";


  @override
  void dispose() {
    myControllerText.dispose();
    super.dispose();
  }

  Future<void> _sendMyMsgPage() async {
    //call to feature file for method
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AdventureQuest"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(45),
                    topRight: Radius.circular(45),
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        CircleAvatar(radius: 45.0,
                          backgroundImage: AssetImage("/Users/rfueston/IdeaProjects/SWE6733_TEAM_2_AdventureQuest/Assests/user2.jpeg"),
                        ),
                        SizedBox(width: 20.0),
                        Text("This is a TEST"),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(width: 20.0),
                        Text("This is also TEST  "),
                        CircleAvatar(radius: 45.0,
                          backgroundImage: AssetImage("/Users/rfueston/IdeaProjects/SWE6733_TEAM_2_AdventureQuest/Assests/user2.jpeg"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 350.0,
              height: 100,
              child: TextField(
                key: Key('chattext'),
                controller: myControllerText,
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Your message',
                ),
              ),
            ),
            ElevatedButton(
              key: Key('sendbutton'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(250, 50),
                maximumSize: const Size(250, 50),
              ),
              onPressed: _sendMyMsgPage,
              child: const Text('SEND'),
            ),
          ],
        ),
      ),
    );
  }
}

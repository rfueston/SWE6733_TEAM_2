import 'package:flutter/material.dart';
import 'main.dart';
import 'account_sign_in.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _MySignInPage();
}

class _MySignInPage extends State<SignInPage> {
  final myControllerUsername = TextEditingController();
  final myControllerPassword = TextEditingController();

  @override
  void dispose() {
    myControllerUsername.dispose();
    myControllerPassword.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    var acceptedAcount = AccountSignIn()
        .accountSignIn(myControllerUsername.text, myControllerPassword.text);

    if (await acceptedAcount == true) {
      setState(() {
        Navigator.push(
          context,
          // MaterialPageRoute(builder: (context) => const MyAdventureQuestHome()),
          MaterialPageRoute(builder: (context) => const MyProfileLayoutTest()),
        );
      });
    } else {
      setState(() {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MyAdventureQuestSignIn()),
        );
      });
    }
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
            const Text(
              'Welcome To AdventureQuest',
              textAlign: TextAlign.start,
            ),
            const Text('\n'),
            SizedBox(
              width: 300.0,
              child: TextField(
                key: Key('siginusername'),
                controller: myControllerUsername,
                maxLength: 40,
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                ),
              ),
            ),
            SizedBox(
              width: 300.0,
              child: TextField(
                key: Key('siginpassword'),
                controller: myControllerPassword,
                maxLength: 40,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            ElevatedButton(
              key: Key('siginbutton'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(300, 60),
                maximumSize: const Size(300, 60),
              ),
              onPressed: _login,
              child: const Text('SUBMIT'),
            ),
          ],
        ),
      ),
    );
  }
}

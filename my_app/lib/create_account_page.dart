import 'package:english_words/english_words.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'main.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _MyCreateAccountPageState();
}

class _MyCreateAccountPageState extends State<CreateAccountPage> {
  void _createAccountLogin() {
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MyApp()),
      );
    });
  }

  void _signIn() {
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MyAdventureQuestSignIn()),
      );
    });
  }

  void _cancelAccountLogin() {
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MyApp()),
      );
    });
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
            const SizedBox(
              width: 300.0,
              child: TextField(
                maxLength: 40,
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'First Name',
                ),
              ),
            ),
            const SizedBox(
              width: 300.0,
              child: TextField(
                maxLength: 40,
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Last Name',
                ),
              ),
            ),
            const SizedBox(
              width: 300.0,
              child: TextField(
                maxLength: 40,
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            const SizedBox(
              width: 300.0,
              child: TextField(
                maxLength: 40,
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Repeat Password',
                ),
              ),
            ),
            const SizedBox(
              width: 300.0,
              child: TextField(
                maxLength: 40,
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email Address',
                ),
              ),
            ),
            const Text('\n'),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(300, 60),
                maximumSize: const Size(300, 60),
              ),
              onPressed: _createAccountLogin,
              child: const Text('Create Account'),
            ),
            RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: '\n',
                  ),
                  const TextSpan(
                    text: 'Already have an account? ',
                  ),
                  TextSpan(
                    text: 'Sign in',
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => _signIn(),
                    style:
                    const TextStyle(decoration: TextDecoration.underline),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

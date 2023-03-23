import 'package:english_words/english_words.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _MyloginPageState();
}

class _MyloginPageState extends State<LoginPage> {
  void _logIn() {
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MyAdventureQuestSignIn()),
      );
    });
  }

  void _createAccount() {
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const MyAdventureQuestAccountPage()),
      );
    });
  }

  void _openTerms() {
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const MyTermsPage()),
      );
    });
  }

  void _openPrivacyPage() {
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const MyPrivacyPolicyPage()),
      );
    });
  }

  void _openCookiesPage() {
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const MyCookiesPolicyPage()),
      );
    });
  }

  void _openResetPasswordPage() {
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const MyResetPasswordPage()),
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
            RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: 'By tapping ‘Sign in’ you agree to our ',
                  ),
                  TextSpan(
                    text: 'Terms',
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => _openTerms(),
                    style:
                        const TextStyle(decoration: TextDecoration.underline),
                  ),
                  const TextSpan(
                    text: '. Learn\nhow we process your data in our ',
                  ),
                  TextSpan(
                    text: 'Privacy Policy',
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => _openPrivacyPage(),
                    style:
                        const TextStyle(decoration: TextDecoration.underline),
                  ),
                  const TextSpan(
                    text: ' and\n',
                  ),
                  TextSpan(
                      text: 'Cookies Policy',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => _openCookiesPage(),
                      style: const TextStyle(
                          decoration: TextDecoration.underline)),
                  const TextSpan(
                    text: '\n\n',
                  )
                ],
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(200, 40),
                maximumSize: const Size(200, 40),
              ),
              onPressed: _logIn,
              child: const Text('SIGN IN'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(200, 40),
                maximumSize: const Size(200, 40),
              ),
              onPressed: _createAccount,
              child: const Text('CREATE ACCOUNT'),
            ),
            RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: '\n',
                  ),
                  TextSpan(
                    text: 'Trouble signing in?',
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => _openResetPasswordPage(),
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

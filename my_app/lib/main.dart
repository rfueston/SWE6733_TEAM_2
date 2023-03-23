import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'create_account_page.dart';
import 'login_page.dart';
import 'cookies_policy_page.dart';
import 'privacy_policy_page.dart';
import 'reset_password_page.dart';
import 'terms_page.dart';
import 'sign_in_page.dart';


void main() {
  runApp(MyAdventureQuestLogin());
}

class MyAdventureQuestLogin extends StatelessWidget {
  const MyAdventureQuestLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'AdventureQuest',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
        ),
        home: LoginPage(),
      ),
    );
  }
}

class MyAdventureQuestSignIn extends StatelessWidget {
  const MyAdventureQuestSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'AdventureQuest',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
        ),
        home: SignInPage(),
      ),
    );
  }
}

class MyAdventureQuestAccountPage extends StatelessWidget {
  const MyAdventureQuestAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'AdventureQuest',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
        ),
        home: CreateAccountPage(),
      ),
    );
  }
}

class MyResetPasswordPage extends StatelessWidget {
  const MyResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'AdventureQuest',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
        ),
        home: ResetPasswordPage(),
      ),
    );
  }
}

class MyTermsPage extends StatelessWidget {
  const MyTermsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'AdventureQuest',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
        ),
        home: TermsPage(),
      ),
    );
  }
}

class MyPrivacyPolicyPage extends StatelessWidget {
  const MyPrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'AdventureQuest',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
        ),
        home: PrivacyPolicyPage(),
      ),
    );
  }
}

class MyCookiesPolicyPage extends StatelessWidget {
  const MyCookiesPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'AdventureQuest',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
        ),
        home: CookiesPolicyPage(),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'AdventureQuest',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
        ),
        home: NavigationBar(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  //TODO:implement
}

class NavigationBar extends StatefulWidget {
  @override
  State<NavigationBar> createState() => MyHomePageState();
}

class MyHomePageState extends State<NavigationBar> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'create_account.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _MyCreateAccountPageState();
}

class _MyCreateAccountPageState extends State<CreateAccountPage> {
  final myControllerFirstName = TextEditingController();
  final myControllerLastName = TextEditingController();
  final myControllerUsername = TextEditingController();
  final myControllerPassword = TextEditingController();
  final myControllerRepeatPassword = TextEditingController();
  final myControllerEmail = TextEditingController();

  @override
  void dispose() {
    myControllerUsername.dispose();
    myControllerPassword.dispose();
    super.dispose();
  }

  Future<void> _createAccountLogin() async {
    var existedAcount =
        CreateAccount().createAccountCheck(myControllerUsername.text);

    if (await existedAcount == true) {
      setState(() {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const MyAdventureQuestSignIn()),
        );
      });
    } else if ((await existedAcount == false &&
        myControllerPassword.text == myControllerRepeatPassword.text
        && myControllerUsername.text != '')) {
      CreateAccount().createUserAccount(
          myControllerFirstName.text,
          myControllerLastName.text,
          myControllerUsername.text,
          myControllerPassword.text,
          myControllerEmail.text);

      setState(() {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MyAdventureQuestHome()),
        );
      });
    } else {
      setState(() {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const MyAdventureQuestLogin()),
        );
      });
    }
  }

  void _signIn() {
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MyAdventureQuestSignIn()),
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
            SizedBox(
              width: 250.0,
              height: 70,
              child: TextField(
                key: Key('createaccountfirstname'),
                controller: myControllerFirstName,
                maxLength: 20,
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'First Name',
                ),
              ),
            ),
            SizedBox(
              width: 250.0,
              height: 70,
              child: TextField(
                key: Key('createaccountlastname'),
                controller: myControllerLastName,
                maxLength: 20,
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Last Name',
                ),
              ),
            ),
            SizedBox(
              width: 250.0,
              height: 70,
              child: TextField(
                key: Key('createaccountusername'),
                controller: myControllerUsername,
                maxLength: 20,
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                ),
              ),
            ),
            SizedBox(
              width: 250.0,
              height: 70,
              child: TextField(
                key: Key('createaccountpassword'),
                controller: myControllerPassword,
                maxLength: 20,
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            SizedBox(
              width: 250.0,
              height: 70,
              child: TextField(
                key: Key('createaccountrepeat'),
                controller: myControllerRepeatPassword,
                maxLength: 20,
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Repeat Password',
                ),
              ),
            ),
            SizedBox(
              width: 250.0,
              height: 70,
              child: TextField(
                key: Key('createaccountemail'),
                controller: myControllerEmail,
                maxLength: 20,
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email Address',
                ),
              ),
            ),
            const Text('\n'),
            ElevatedButton(
              key: Key('createbuttonAccount'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(250, 40),
                maximumSize: const Size(250, 40),
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
                    recognizer: TapGestureRecognizer()..onTap = () => _signIn(),
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

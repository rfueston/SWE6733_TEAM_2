import 'package:flutter/material.dart';
import 'main.dart';
import 'account_sign_in.dart';

class ProfileMgmtPage extends StatefulWidget {
  const ProfileMgmtPage({super.key});

  @override
  State<ProfileMgmtPage> createState() => _MyProfileMgmtPage();
}

class _MyProfileMgmtPage extends State<ProfileMgmtPage> {
  // Bio settings
  //picture
  final myControllerBio = TextEditingController();
  // Account settings
  final myControllerUsername = TextEditingController();
  final myControllerPassword = TextEditingController();
  final myControllerDOB = TextEditingController();
  final myControllerEmail = TextEditingController();
  // Location settings
  final myControllerState = TextEditingController();
  //Activities settings
  final myControllerSkiing = TextEditingController();
  final myControllerHiking = TextEditingController();
  final myControllerSwimming = TextEditingController();
  final myControllerDancing = TextEditingController();
  final myControllerFootball = TextEditingController();

  @override
  void dispose() {
    // Bio settings
    // picture
    myControllerBio.dispose();
    // Account settings
    // myControllerUsername.dispose();
    // myControllerPassword.dispose();
    myControllerDOB.dispose();
    myControllerEmail.dispose();
    // Location settings
    myControllerState.dispose();
    //Activities settings
    myControllerSkiing.dispose();
    myControllerHiking.dispose();
    myControllerSwimming.dispose();
    myControllerDancing.dispose();
    myControllerFootball.dispose();
    super.dispose();
  }

  Future<void> _updateProfile() async {
/*     var acceptedAcount = AccountSignIn()
        .accountSignIn(myControllerUsername.text, myControllerPassword.text); */

    //if (await acceptedAcount == true) {
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MyAdventureQuestHome()),
      );
    });
/*     } else {
      setState(() {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const MyAdventureQuestSignIn()),
        );
      });
    } */
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
              'My AdventureQuest Profile',
              textAlign: TextAlign.start,
            ),
            const Text('\n'),
            const Image(
              key: Key('profilePic'),
              width: 300.0,
              image: NetworkImage(
                  'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
            ),
            const Text('\n'),
            SizedBox(
              width: 600.0,
              child: TextField(
                key: Key('profileBio'),
                controller: myControllerBio,
                maxLength: 1000,
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'My Bio',
                ),
              ),
            ),
            SizedBox(
              width: 300.0,
              child: TextField(
                key: Key('profileDOB'),
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
              key: Key('updateProfileButton'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(300, 60),
                maximumSize: const Size(300, 60),
              ),
              onPressed: _updateProfile,
              child: const Text('UPDATE'),
            ),
          ],
        ),
      ),
    );
  }
}
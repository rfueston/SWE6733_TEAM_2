import 'package:flutter/material.dart';
import 'main.dart';

class ProfileLayoutTest extends StatefulWidget {
  const ProfileLayoutTest({super.key});

  @override
  State<ProfileLayoutTest> createState() => _MyProfileLayoutTest();
}

class _MyProfileLayoutTest extends State<ProfileLayoutTest> {
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
  void initState() {
    super.initState();
  }

  void dispose() {
    // Bio settings
    // picture
    myControllerBio.dispose();
    // Account settings
    myControllerUsername.dispose();
    myControllerPassword.dispose();
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

  late final bioWidget = SingleChildScrollView(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
        const Text(
          'Bio Section',
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
            //controller: myControllerBio,
            maxLength: 1000,
            obscureText: false,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'My Bio',
            ),
          ),
        ),
      ]));

  late final accountSettingsWidget = SingleChildScrollView(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
        const Text(
          'Account Settings',
          textAlign: TextAlign.start,
        ),
        SizedBox(
          width: 300.0,
          child: TextField(
            key: Key('profileUsername'),
            enabled: false,
            controller: myControllerDOB,
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
            key: Key('profilePassword'),
            enabled: false,
            controller: myControllerEmail,
            maxLength: 40,
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Password',
            ),
          ),
        ),
        SizedBox(
          width: 300.0,
          child: TextField(
            key: Key('profileDOB'),
            controller: myControllerDOB,
            maxLength: 40,
            obscureText: false,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'DOB',
            ),
          ),
        ),
        SizedBox(
          width: 300.0,
          child: TextField(
            key: Key('profileEmail'),
            controller: myControllerEmail,
            maxLength: 40,
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Email',
            ),
          ),
        ),
      ]));

  late final locationSettingsWidget = SingleChildScrollView(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
        const Text(
          'Location Settings',
          textAlign: TextAlign.start,
        ),
      ]));

  late final activitiesSettingsWidget =
      Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
    const Text(
      'Activities Settings',
      textAlign: TextAlign.start,
    ),
  ]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            bioWidget,
            const Text('\n'),
            Container(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  accountSettingsWidget,
                  locationSettingsWidget,
                  activitiesSettingsWidget,
                ],
              ),
            ),

/*             SizedBox(
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
            ), */
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

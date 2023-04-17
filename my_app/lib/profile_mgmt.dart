import 'package:flutter/material.dart';
import 'main.dart';

class ProfileMgmtPage extends StatefulWidget {
  const ProfileMgmtPage({super.key});

  @override
  State<ProfileMgmtPage> createState() => _MyProfileMgmtPage();
}

class _MyProfileMgmtPage extends State<ProfileMgmtPage> {
  // Bio settings
  // myPicture
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
    // myPicture
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
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MyAdventureQuestHome()),
      );
    });
  }
//
  late final bioSettingsWidget =
      Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
    const Text(
      'Bio Section',
      textAlign: TextAlign.start,
    ),
    const Image(
      key: Key('profilepic'),
      width: 300.0,
      image: NetworkImage(
          'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
    ),
    const Text('\n'),
    SizedBox(
      width: 600.0,
      child: TextField(
        key: Key('profilebio'),
        controller: myControllerBio,
        maxLength: 1000,
        obscureText: false,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'My Bio',
        ),
      ),
    ),
  ]);
//
  late final accountSettingsWidget =
      Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
    const Text(
      'Account Settings',
      textAlign: TextAlign.start,
    ),
    SizedBox(
      width: 300.0,
      child: TextField(
        key: Key('profileusername'),
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
        key: Key('profilepassword'),
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
        key: Key('profiledob'),
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
        key: Key('profileemail'),
        controller: myControllerEmail,
        maxLength: 40,
        obscureText: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Email',
        ),
      ),
    ),
  ]);
//
  String dropDownValue = 'Georgia';
  var items = ['Georgia', 'Florida', 'Hawaii', 'Nevada', 'Utah'];

  late final locationSettingsWidget = DropdownButtonFormField(
      key: Key('profilelocation'),
      alignment: Alignment.center,
      decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(left: 150.0, right: 150.0)),
      value: dropDownValue,
      items: items.map((String items) {
        return DropdownMenuItem(
          value: items,
          child: Text(items),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          dropDownValue = newValue!;
        });
      });
//
  bool valueSkiing = false;
  bool valueHiking = false;
  bool valueSwimming = false;
  bool valueDancing = false;
  bool valueFootball = false;

  late final activitySettingsWidget =
      StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
    return Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
          const Text(
            'Activity Settings',
            textAlign: TextAlign.center,
          ),
          CheckboxListTile(
            key: Key('activityskiing'),
            contentPadding: EdgeInsets.only(left: 150, right: 150),
            secondary: const Icon(Icons.sports),
            title: const Text('Skiing'),
            selected: valueSkiing,
            value: valueSkiing,
            onChanged: (value) {
              setState(() {
                valueSkiing = value!;
              });
            },
          ),
          CheckboxListTile(
            //controlAffinity: ListTileControlAffinity.trailing,
            key: Key('activityhiking'),
            contentPadding: EdgeInsets.only(left: 150, right: 150),
            secondary: const Icon(Icons.sports),
            title: const Text('Hiking'),
            selected: valueHiking,
            value: valueHiking,
            onChanged: (value) {
              setState(() {
                valueHiking = value!;
              });
            },
          ),
          CheckboxListTile(
            //controlAffinity: ListTileControlAffinity.trailing,
            key: Key('activityswimming'),
            contentPadding: EdgeInsets.only(left: 150, right: 150),
            secondary: const Icon(Icons.sports),
            title: const Text('Swimming'),
            selected: valueSwimming,
            value: valueSwimming,
            onChanged: (value) {
              setState(() {
                valueSwimming = value!;
              });
            },
          ),
          CheckboxListTile(
            //controlAffinity: ListTileControlAffinity.trailing,
            key: Key('activitydancing'),
            contentPadding: EdgeInsets.only(left: 150, right: 150),
            secondary: const Icon(Icons.sports),
            title: const Text('Dancing'),
            selected: valueDancing,
            value: valueDancing,
            onChanged: (value) {
              setState(() {
                valueDancing = value!;
              });
            },
          ),
          CheckboxListTile(
            //controlAffinity: ListTileControlAffinity.trailing,
            key: Key('activityfootball'),
            contentPadding: EdgeInsets.only(left: 150, right: 150),
            secondary: const Icon(Icons.sports),
            title: const Text('Football'),
            selected: valueFootball,
            value: valueFootball,
            onChanged: (value) {
              setState(() {
                valueFootball = value!;
              });
            },
          ),
        ]));
  });
//
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            bioSettingsWidget,
            const Text('\n'),
            accountSettingsWidget,
            const Text(
              'Location Settings',
              textAlign: TextAlign.center,
            ),
            locationSettingsWidget,
            activitySettingsWidget,
            ElevatedButton(
              key: Key('updateprofilebutton'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(200, 60),
                maximumSize: const Size(200, 60),
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

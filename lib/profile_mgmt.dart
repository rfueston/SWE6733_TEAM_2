import 'package:adventurequest/match_bike_page.dart';
import 'package:adventurequest/match_hiking_page.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'dart:io';
import 'dart:io' as io;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart';
import 'package:intl/intl.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ProfileMgmtPage());
}

class ProfileMgmtPage extends StatefulWidget {
  const ProfileMgmtPage({super.key});

  @override
  State<ProfileMgmtPage> createState() => _MyProfileMgmtPage();
}

class _MyProfileMgmtPage extends State<ProfileMgmtPage> {
  // Bio settings
  // myPicture
  File? _image;
  final myControllerBio = TextEditingController();
  // Account settings
  final myControllerUsername = TextEditingController();
  final myControllerPassword = TextEditingController();
  final myControllerDOB = TextEditingController();
  final myControllerEmail = TextEditingController();
  // Location settings
  final myControllerState = TextEditingController();
  //Activities settings
  final myControllerBiking = TextEditingController();
  final myControllerHiking = TextEditingController();
  final myControllerRunning = TextEditingController();

  void _setImage(File? image) {
    setState(() {
      _image = image;
    });
  }

  String? fileName;

  void setFileName(String name) {
    setState(() {
      fileName = name;
    });
  }

  // @override
  // void initState() {
  //   super.initState();
  // }

  void _showImageUploadOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Select from Gallery'),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.gallery);
                },
              ),
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text('Take a Photo'),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.camera);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _deleteImage() {
    setState(() {
      _image = null;
    });
  }

  _uploadImage() async {
    try {
      firebase_storage.UploadTask uploadTask;

      firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
          .ref()
          .child('product')
          .child('/' + (fileName ?? ''));

      uploadTask = ref.putFile(File(_image!.path));

      await uploadTask.whenComplete(() => null);
      String imageUrl = await ref.getDownloadURL();
      print('Uploaded Image URL' + imageUrl);
    } catch (e) {
      print(e);
    }
  }

  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    XFile? pickedFile;
    if (kIsWeb) {
      // For web, use ImagePickerWeb
      pickedFile = await picker.pickImage(source: source);
    } else {
      // For other platforms, use ImagePicker
      pickedFile = await picker.pickImage(source: source);
    }

    if (pickedFile != null) {
      setFileName(pickedFile.path.split('/').last);
      _setImage(File(pickedFile.path));
    }
  }

  _selectFile(bool imageFrom) async {
    var file = await ImagePicker().pickImage(
        source: imageFrom ? ImageSource.gallery : ImageSource.camera);

    print(file!.name);
  }

  Future<void> _updateProfile() async {
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MyAdventureQuestHome()),
      );
    });
  }

  // void dispose() {
  //   // Bio settings
  //   // myPicture
  //   myControllerBio.dispose();
  //   // Account settings
  //   myControllerUsername.dispose();
  //   myControllerPassword.dispose();
  //   myControllerDOB.dispose();
  //   myControllerEmail.dispose();
  //   // Location settings
  //   myControllerState.dispose();
  //   //Activities settings
  //   myControllerBiking.dispose();
  //   myControllerHiking.dispose();
  //   myControllerRunning.dispose();
  //   super.dispose();
  // }

//
  // late final bioSettingsWidget =
  //     Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
  //   const Text(
  //     'Bio Section',
  //     textAlign: TextAlign.start,
  //   ),
  //   _image == null
  //       ? Text('No image selected')
  //       : Image.file(
  //           _image!,
  //           width: 200,
  //           height: 200,
  //         ),
  //   Row(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: [
  //       ElevatedButton(
  //         onPressed: () => _showImageUploadOptions(context),
  //         child: Text('Replace'),
  //       ),
  //       SizedBox(width: 10), // Add some space between the buttons
  //       ElevatedButton(
  //         onPressed: () => _deleteImage(),
  //         child: Text('Delete'),
  //       ),
  //       SizedBox(width: 10), // Add some space between the buttons
  //       ElevatedButton(
  //         onPressed: () => _uploadImage(),
  //         // onPressed: () {},
  //         child: Text('Upload'),
  //       ),
  //     ],
  //   ),
  // const Image(
  //   key: Key('profilepic'),
  //   width: 300.0,
  //   image: AssetImage(
  //       '/Users/rfueston/IdeaProjects/SWE6733_TEAM_2_AdventureQuest/Assests/user2.jpeg'),
  // ),
//     const Text('\n'),
//     SizedBox(
//       width: 600.0,
//       child: TextField(
//         key: Key('profilebio'),
//         controller: myControllerBio,
//         maxLength: 1000,
//         obscureText: false,
//         decoration: InputDecoration(
//           border: OutlineInputBorder(),
//           labelText: 'My Bio',
//         ),
//       ),
//     ),
//   ]);
// //
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
  bool valueBiking = false;
  bool valueHiking = false;
  bool valueRunning = false;

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
            key: Key('activitybiking'),
            contentPadding: EdgeInsets.only(left: 150, right: 150),
            secondary: const Icon(Icons.sports),
            title: const Text('Biking'),
            selected: valueBiking,
            value: valueBiking,
            onChanged: (value) {
              setState(() {
                valueBiking = value!;
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
            key: Key('activityrunning'),
            contentPadding: EdgeInsets.only(left: 150, right: 150),
            secondary: const Icon(Icons.sports),
            title: const Text('Running'),
            selected: valueRunning,
            value: valueRunning,
            onChanged: (value) {
              setState(() {
                valueRunning = value!;
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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _image == null
                  ? Text('No image selected')
                  : Image.file(
                      _image!,
                      width: 200,
                      height: 200,
                    ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => _showImageUploadOptions(context),
                    child: Text('Replace'),
                  ),
                  SizedBox(width: 10), // Add some space between the buttons
                  ElevatedButton(
                    onPressed: () => _deleteImage(),
                    child: Text('Delete'),
                  ),
                  SizedBox(width: 10), // Add some space between the buttons
                  ElevatedButton(
                    onPressed: () => _uploadImage(),
                    // onPressed: () {},
                    child: Text('Upload'),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Card(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Bio',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: myControllerBio,
                        maxLines: null,
                        decoration: InputDecoration(
                          hintText: 'Write something about yourself',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              //bioSettingsWidget,
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
      ),
    );
  }
}

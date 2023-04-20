//import 'dart:html';
//import 'account_sign_in.dart';
//import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
//import 'main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

const List<String> rating = ["0","1","2","3","4","5","6","7","8","9","10"];
const user = "sdu1";
//add user at log in from getter
// final user = AccountSignIn.getglobalAccountUsername;


class Adventure {
  final String? id;
  final int? preference;
  final int? skill;
  final int? group;

  const Adventure({
    this.id,
     this.preference,
     this.skill,
     this.group,
  });

  toJson() {
    return {"preference": preference, "skill": skill, "group": group};
  }

  factory Adventure.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document){
    final data = document.data()!;
    return Adventure(
      id: document.id,
      preference: data["preference"],
      skill: data["skill"],
      group: data["group"],
    );
  }

}

class AdventureRatingPage extends StatelessWidget {
  const AdventureRatingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const WidgetSetup(),
    );
  }


}

class WidgetSetup extends StatefulWidget {
  const WidgetSetup({super.key});

  @override
  State<WidgetSetup> createState() => _WidgetSetupState();
}

class _WidgetSetupState extends State<WidgetSetup> {

  List<Iterable<Adventure>> myExistingAdv = List.empty();

  //get data from Firebase
  _WidgetSetupState()  {

  }

  final _db = FirebaseFirestore.instance;
  //get MyAdventures list
  Future<List<Adventure>> getMyAdventures(String user) async {
    final snapshot = await _db.collection("AdventureRatings")
        .doc(user).collection("MyAdventureRatings").get();
    final myAdventuresData = snapshot.docs.map((e)
        => Adventure.fromSnapshot(e)).toList();
    return myAdventuresData;
  }

  getAdventures(){
     return getMyAdventures(user);
  }

  Future<void> udpateMyAdventure(String docId, String ratingType, int rate) async{
    final CollectionReference myAdvCollection =
      FirebaseFirestore.instance.collection("AdventureRatings")
          .doc(user).collection("MyAdventureRatings");

    final data = <String, dynamic>{
      ratingType : rate,
    };

    var docRef  = await myAdvCollection.doc(docId);
    docRef.get().then((doc) async =>
    {
      if (doc.exists) {
          await myAdvCollection.doc(docId).update(data)
      } else {
          await myAdvCollection.doc(docId).set(data)
      }
    });
  }

  String? _docBiking = "biking";
  String? _docHiking = "hiking";
  String? _docRunning = "running";

  String _attrGroup = "group";
  String _attrPreference = "preference";
  String _attrSkill = "skill";

  String _currentBikingGroup = "0";
  String _currentBikingPreference = "0";
  String _currentBikingSkill = "0";
  String _currentHikingGroup = "0";
  String _currentHikingPreference = "0";
  String _currentHikingSkill = "0";
  String _currentRunningGroup = "0";
  String _currentRunningPreference = "0";
  String _currentRunningSkill = "0";


  // bool _currentBikingGroupInit = true;
  // bool _currentBikingPreferenceInit = true;
  // bool _currentBikingSkillInit = true;
  // bool _currentHikingGroupInit = true;
  // bool _currentHikingPreferenceInit = true;
  // bool _currentHikingSkillInit = true;
  // bool _currentRunningGroupInit = true;
  // bool _currentRunningPreferenceInit = true;
  // bool _currentRunningSkillInit = true;

  double mainActivityTextSize = 20;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(child:SingleChildScrollView(
          child: FutureBuilder<List<Adventure>>(
            future: getAdventures(),
            builder: (ctx, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  // If we got an error
                  if (snapshot.hasData) {
                    snapshot.data!.forEach((element) {
                      String? id = element.id;
                      switch(id) {
                        case "biking":{
                          _currentBikingGroup = element.group.toString();
                          _currentBikingPreference = element.preference.toString();
                          _currentBikingSkill = element.skill.toString();
                          if (_currentBikingGroup == "null"){
                            _currentBikingGroup ="0";
                          }
                          if (_currentBikingPreference == "null"){
                            _currentBikingPreference ="0";
                          }
                          if (_currentBikingSkill == "null"){
                            _currentBikingSkill ="0";
                          }
                        }
                        break;
                        case "hiking":{
                          _currentHikingGroup = element.group.toString();
                          _currentHikingPreference = element.preference.toString();
                          _currentHikingSkill = element.skill.toString();
                          if (_currentHikingGroup == "null"){
                            _currentHikingGroup ="0";
                          }
                          if (_currentHikingPreference == "null"){
                            _currentHikingPreference ="0";
                          }
                          if (_currentHikingSkill == "null"){
                            _currentHikingSkill ="0";
                          }
                        }
                        break;
                        case "running":{
                          _currentRunningGroup = element.group.toString();
                          _currentRunningPreference = element.preference.toString();
                          _currentRunningSkill = element.skill.toString();
                          if (_currentRunningGroup == "null"){
                            _currentRunningGroup ="0";
                          }
                          if (_currentRunningPreference == "null"){
                            _currentRunningPreference ="0";
                          }
                          if (_currentRunningSkill == "null"){
                            _currentRunningSkill ="0";
                          }
                        }
                        break;
                      }
                    });
                      return Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Text(
                                "Activity: ${(_docBiking)}",
                                style: TextStyle(
                                    fontSize: mainActivityTextSize,
                                    color: Colors.blue),),
                            ),
                            Container(
                              child: Text("Do you like biking?"),
                            ),
                            Container(
                              child: DropdownButton<String>(
                                  items: rating.map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value.toString(),
                                      child: Text(value.toString()),
                                    );
                                  }).toList(),
                                  value: _currentBikingPreference.toString(),
                                  icon: const Icon(Icons.arrow_downward),
                                  elevation: 16,
                                  style: const TextStyle(color: Colors.deepPurple),
                                  underline: Container(
                                    height: 2,
                                    color: Colors.deepPurpleAccent,
                                  ),
                                  onChanged: (String? value) {
                                    // This is called when the user selects an item.
                                    setState(() {
                                      udpateMyAdventure(_docBiking!, _attrPreference, int.parse(value!));
                                      _currentBikingPreference = value;
                                    });
                                  },

                                ),
                              ),
                            Container(
                              child: Text("What is your skill level?"),
                            ),
                            Container(
                              child: DropdownButton<String>(
                                items: rating.map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value.toString(),
                                    child: Text(value.toString()),
                                  );
                                }).toList(),
                                value: _currentBikingSkill.toString(),
                                icon: const Icon(Icons.arrow_downward),
                                elevation: 16,
                                style: const TextStyle(color: Colors.deepPurple),
                                underline: Container(
                                  height: 2,
                                  color: Colors.deepPurpleAccent,
                                ),
                                onChanged: (String? value) {
                                  // This is called when the user selects an item.
                                  setState(() {
                                    udpateMyAdventure(_docBiking!, _attrSkill, int.parse(value!));
                                    _currentBikingSkill = value;
                                  });
                                },
                              ),
                            ),
                            Container(
                              child: Text("Do you want to do this in group?"),
                            ),
                            Container(
                              child: DropdownButton<String>(
                                items: rating.map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value.toString(),
                                    child: Text(value.toString()),
                                  );
                                }).toList(),
                                value: _currentBikingGroup.toString(),
                                icon: const Icon(Icons.arrow_downward),
                                elevation: 16,
                                style: const TextStyle(color: Colors.deepPurple),
                                underline: Container(
                                  height: 2,
                                  color: Colors.deepPurpleAccent,
                                ),
                                onChanged: (String? value) {
                                  // This is called when the user selects an item.
                                  setState(() {
                                    udpateMyAdventure(_docBiking!, _attrGroup, int.parse(value!));
                                    _currentBikingGroup = value;
                                  });
                                },
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(bottom: 10, top: 10),
                              child: Text("Activity: ${(_docHiking)}",
                              style: TextStyle(
                                  fontSize: mainActivityTextSize,
                                  color: Colors.blue),),
                            ),
                            Container(
                              child: Text("Do you like hiking?"),
                            ),
                            Container(
                              child: DropdownButton<String>(
                                items: rating.map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value.toString(),
                                    child: Text(value.toString()),
                                  );
                                }).toList(),
                                value: _currentHikingPreference.toString(),
                                icon: const Icon(Icons.arrow_downward),
                                elevation: 16,
                                style: const TextStyle(color: Colors.deepPurple),
                                underline: Container(
                                  height: 2,
                                  color: Colors.deepPurpleAccent,
                                ),
                                onChanged: (String? value) {
                                  // This is called when the user selects an item.
                                  setState(() {
                                    udpateMyAdventure(_docHiking!, _attrPreference, int.parse(value!));
                                    _currentHikingPreference = value;
                                  });
                                },
                              ),
                            ),
                            Container(
                              child: Text("What is your skill level?"),
                            ),
                            Container(
                              child: DropdownButton<String>(
                                items: rating.map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value.toString(),
                                    child: Text(value.toString()),
                                  );
                                }).toList(),
                                value: _currentHikingSkill.toString(),
                                icon: const Icon(Icons.arrow_downward),
                                elevation: 16,
                                style: const TextStyle(color: Colors.deepPurple),
                                underline: Container(
                                  height: 2,
                                  color: Colors.deepPurpleAccent,
                                ),
                                onChanged: (String? value) {
                                  // This is called when the user selects an item.
                                  setState(() {
                                    udpateMyAdventure(_docHiking!, _attrSkill, int.parse(value!));
                                    _currentHikingSkill = value;
                                  });
                                },
                              ),
                            ),
                            Container(
                              child: Text("Do you want to do this in group?"),
                            ),
                            Container(
                              child: DropdownButton<String>(
                                items: rating.map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value.toString(),
                                    child: Text(value.toString()),
                                  );
                                }).toList(),
                                value: _currentHikingGroup.toString(),
                                icon: const Icon(Icons.arrow_downward),
                                elevation: 16,
                                style: const TextStyle(color: Colors.deepPurple),
                                underline: Container(
                                  height: 2,
                                  color: Colors.deepPurpleAccent,
                                ),
                                onChanged: (String? value) {
                                  // This is called when the user selects an item.
                                  setState(() {
                                    udpateMyAdventure(_docHiking!, _attrGroup, int.parse(value!));
                                    _currentHikingGroup = value;
                                  });
                                },
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(bottom: 10, top: 10),
                              child: Text("Activity: ${(_docRunning)}",
                                style: TextStyle(
                                    fontSize: mainActivityTextSize,
                                    color: Colors.blue),),
                            ),
                            Container(
                              child: Text("Do you like running?"),
                            ),
                            Container(
                              child: DropdownButton<String>(
                                items: rating.map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value.toString(),
                                    child: Text(value.toString()),
                                  );
                                }).toList(),
                                value: _currentRunningPreference.toString(),
                                icon: const Icon(Icons.arrow_downward),
                                elevation: 16,
                                style: const TextStyle(color: Colors.deepPurple),
                                underline: Container(
                                  height: 2,
                                  color: Colors.deepPurpleAccent,
                                ),
                                onChanged: (String? value) {
                                  // This is called when the user selects an item.
                                  setState(() {
                                    udpateMyAdventure(_docRunning!, _attrPreference, int.parse(value!));
                                    _currentRunningPreference = value;
                                  });
                                },

                              ),
                            ),
                            Container(
                              child: Text("What is your skill level?"),
                            ),
                            Container(
                              child: DropdownButton<String>(
                                items: rating.map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value.toString(),
                                    child: Text(value.toString()),
                                  );
                                }).toList(),
                                value: _currentRunningSkill.toString(),
                                icon: const Icon(Icons.arrow_downward),
                                elevation: 16,
                                style: const TextStyle(color: Colors.deepPurple),
                                underline: Container(
                                  height: 2,
                                  color: Colors.deepPurpleAccent,
                                ),
                                onChanged: (String? value) {
                                  // This is called when the user selects an item.
                                  setState(() {
                                    udpateMyAdventure(_docRunning!, _attrSkill, int.parse(value!));
                                    _currentRunningSkill = value;
                                  });
                                },
                              ),
                            ),
                            Container(
                              child: Text("Do you want to do this in group?"),
                            ),
                            Container(
                              child: DropdownButton<String>(
                                items: rating.map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value.toString(),
                                    child: Text(value.toString()),
                                  );
                                }).toList(),
                                value: _currentRunningGroup.toString(),
                                icon: const Icon(Icons.arrow_downward),
                                elevation: 16,
                                style: const TextStyle(color: Colors.deepPurple),
                                underline: Container(
                                  height: 2,
                                  color: Colors.deepPurpleAccent,
                                ),
                                onChanged: (String? value) {
                                  // This is called when the user selects an item.
                                  setState(() {
                                    udpateMyAdventure(_docRunning!, _attrGroup, int.parse(value!));
                                    _currentRunningGroup = value;
                                  });
                                },
                              ),
                            ),
                          ]
                      );
                  } else if (snapshot.hasError){
                    return Center(child: Text(snapshot.error.toString()));
                  } else {
                    return const Center(child: Text('Something went wrong'));
                  }

                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              }
          )
        ))
      ),
    );
  }
}



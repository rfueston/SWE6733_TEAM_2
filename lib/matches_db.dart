import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'account_sign_in.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'main.dart';

final user = FirebaseAuth.instance.currentUser?.email;

class Matches {
  List<AdventureMatch> _match = [
    AdventureMatch(
      id: 'biking',
      preference: 2,
      skill: 2,
    ),
    AdventureMatch(
      id: 'hiking',
      preference: 2,
      skill: 2,
    ),
    AdventureMatch(
      id: 'running',
      preference: 2,
      skill: 2,
    ),
  ].reversed.toList();

  List<Iterable<AdventureMatch>> myExistingAdv = List.empty();

  final _db = FirebaseFirestore.instance;

  //get match list
  // Future<List<AdventureMatch>>
  Future getMyAdventureMatch() async {

    String? _userMatches;
    String? _sizeMatches;
     int? _test1 = 0;
     int? _test2 = 0;


    final documentSnapshot = await _db.collection("AdventureRatings").doc("testuser3@email.com").get();
    final data = documentSnapshot.data();

    final bike = data?['biking'];


    print("RGF??????????????");
    print(bike.toString());
    print("RGF??????????????");
    print(bike.toString());
    print("RGF??????????????");

    await _db.collection("AdventureRatings").get().then(
      (querySnapshot) {
        for (var docSnapshot in querySnapshot.docs) {

          var matchesAmount = querySnapshot.size;
          var matches = docSnapshot.id;

          _sizeMatches = matchesAmount.toString();
          _userMatches = matches.toString();

           _db.collection("AdventureRatings").doc("testuser3@email.com").collection("MyAdventureRatings").doc("biking").get().then(
                (querySnapshot2) {
                    var _test3 = querySnapshot2.data()?['skill'];
                    var _test4 = querySnapshot2.data()?['preference'];

                    _test1 = _test4;
                    _test2 = _test4;
            },
            onError: (e) => print("Error completing: $e"),
          );


          _db.collection("AdventureRatings").doc(matches).collection("MyAdventureRatings").doc("hiking").get().then(
                (querySnapshot3) {
              print("hiking skill: ${querySnapshot3.data()?['skill']}");
              print("hiking preference: ${querySnapshot3.data()?['preference']}");
            },
            onError: (e) => print("Error completing: $e"),
          );

          _db.collection("AdventureRatings").doc(matches).collection("MyAdventureRatings").doc("running").get().then(
                (querySnapshot4) {
              print("running skill: ${querySnapshot4.data()?['preference']}");
              print("running preference: ${querySnapshot4.data()?['skill']}");
            },
            onError: (e) => print("Error completing: $e"),
          );
        }
      },
      onError: (e) => print("Error completing: $e"),
    );

    print("RGF??????????????");
    print(_test2.toString());
    print("RGF??????????????");
    print(_test1.toString());
    print("RGF??????????????");


    // for (int i = 0; i < 5; i++) {
    //   print('GeeksForGeeks');
    // }

    // final myAdventuresData = "true";

    // print(myAdventuresData);
    //
    // print(myAdventuresData);
    //
    //
    //
    // return myAdventuresData;
  }

  getAdventureMatch() async {
    return getMyAdventureMatch();
  }

  int hikingRating() {
    //is your preference larger than the other person?
    //is your preference smaller than the other person?
    //is your preference the same
    //is your skill larger than the other person?
    //is your skill smaller than the other person?
    //is your skill the same

    var preference = 0;
    var skill = 0;
    var yourPreference = 0;
    var yourSkill = 0;
    var matchCount = 0;

    if (preference == yourPreference) {
      matchCount++;
    } else {
      matchCount--;
    }

    if (skill == yourSkill) {
      matchCount++;
    } else {
      matchCount--;
    }

    return matchCount;
  }

  int bikingRating() {
    var preference = 0;
    var skill = 0;
    var yourPreference = 0;
    var yourSkill = 0;
    var matchCount = 0;

    if (preference == yourPreference) {
      matchCount++;
    } else {
      matchCount--;
    }

    if (skill == yourSkill) {
      matchCount++;
    } else {
      matchCount--;
    }

    return matchCount;
  }

  int runningRating() {
    var preference = 0;
    var skill = 0;
    var yourPreference = 0;
    var yourSkill = 0;
    var matchCount = 0;

    if (preference == yourPreference) {
      matchCount++;
    } else {
      matchCount--;
    }

    if (skill == yourSkill) {
      matchCount++;
    } else {
      matchCount--;
    }

    return matchCount;
  }

  Future<int> findMatching() async {
    var rating = 0;

    // if (_match.AdventureMatch.id == 'biking') {
    //   rating = rating + hikingRating() as int;
    // }
    //
    // if (_match.AdventureMatch.id == 'hiking') {
    //   //this is for hiking
    //   rating = rating + hikingRating() as int;
    // }
    //
    // if (_match.AdventureMatch.id == 'running') {
    //   rating = rating + hikingRating() as int;
    // }

    var totalMatchRating = rating;

    return totalMatchRating;
  }

  void findOrderMatch() {

//create loop to store list of each user in
// order if match rating is above 0 and then
// list each user as a match
    findMatching();




  }
}

class AdventureMatch {
  final String? id;
  final int? preference;
  final int? skill;

  const AdventureMatch({
    this.id,
    this.preference,
    this.skill,
  });

  toJson() {
    return {"preference": preference, "skill": skill};
  }

  factory AdventureMatch.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return AdventureMatch(
      id: document.id,
      preference: data["preference"],
      skill: data["skill"],
    );
  }
}

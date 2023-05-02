import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'account_sign_in.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'main.dart';

final user = FirebaseAuth.instance.currentUser?.email;

class Matches {

  final _db = FirebaseFirestore.instance;

  //get match list
  Future<Map> getMyAdventureMatch() async {
    String? _userMatches;
    String? _sizeMatches;
    int? bikingSkill = 0;
    int? bikingPreference = 0;
    int? hikingSkill = 0;
    int? hikingPreference = 0;
    int? runningSkill = 0;
    int? runningPreference = 0;
    int? yourBikingSkill = 0;
    int? yourBikingPreference = 0;
    int? yourHikingSkill = 0;
    int? yourHikingPreference = 0;
    int? yourRunningSkill = 0;
    int? yourRunningPreference = 0;
    var userMatchedFinalRating = {};

    await _db.collection("AdventureRatings").get().then(
      (querySnapshot) async {
        for (var docSnapshot in querySnapshot.docs) {
          var matchesAmount = querySnapshot.size;
          var matches = docSnapshot.id;

          _sizeMatches = matchesAmount.toString();
          _userMatches = matches.toString();
          int userMatchRating = 0;

          await _db
              .collection("AdventureRatings")
              .doc(user)
              .collection("MyAdventureRatings")
              .doc("biking")
              .get()
              .then(
            (querySnapshot2) {
              yourBikingSkill = querySnapshot2.data()?['skill'];
              yourBikingPreference = querySnapshot2.data()?['preference'];
            },
            onError: (e) => print("Error completing: $e"),
          );

          await _db
              .collection("AdventureRatings")
              .doc(matches)
              .collection("MyAdventureRatings")
              .doc("biking")
              .get()
              .then(
            (querySnapshot2) {
              bikingSkill = querySnapshot2.data()?['skill'];
              bikingPreference = querySnapshot2.data()?['preference'];
            },
            onError: (e) => print("Error completing: $e"),
          );

          userMatchRating = matchRating(bikingPreference, bikingSkill,
              yourBikingPreference, yourBikingSkill);

          await _db
              .collection("AdventureRatings")
              .doc(user)
              .collection("MyAdventureRatings")
              .doc("hiking")
              .get()
              .then(
            (querySnapshot3) {
              yourHikingSkill = querySnapshot3.data()?['skill'];
              yourHikingPreference = querySnapshot3.data()?['preference'];
            },
            onError: (e) => print("Error completing: $e"),
          );

          await _db
              .collection("AdventureRatings")
              .doc(matches)
              .collection("MyAdventureRatings")
              .doc("hiking")
              .get()
              .then(
            (querySnapshot3) {
              hikingSkill = querySnapshot3.data()?['skill'];
              hikingPreference = querySnapshot3.data()?['preference'];
            },
            onError: (e) => print("Error completing: $e"),
          );

          userMatchRating = userMatchRating +
              matchRating(hikingPreference, hikingSkill, yourHikingPreference,
                  yourHikingSkill);

          await _db
              .collection("AdventureRatings")
              .doc(user)
              .collection("MyAdventureRatings")
              .doc("running")
              .get()
              .then(
            (querySnapshot4) {
              yourRunningSkill = querySnapshot4.data()?['skill'];
              yourRunningPreference = querySnapshot4.data()?['preference'];
            },
            onError: (e) => print("Error completing: $e"),
          );

          await _db
              .collection("AdventureRatings")
              .doc(matches)
              .collection("MyAdventureRatings")
              .doc("running")
              .get()
              .then(
            (querySnapshot4) {
              runningSkill = querySnapshot4.data()?['skill'];
              runningPreference = querySnapshot4.data()?['preference'];
            },
            onError: (e) => print("Error completing: $e"),
          );

          userMatchRating = userMatchRating +
              matchRating(runningPreference, runningSkill,
                  yourRunningPreference, yourRunningSkill);

          userMatchedFinalRating['${_userMatches}'] = '${userMatchRating}';
        }
      },
      onError: (e) => print("Error completing: $e"),
    );

    List matchedList = [];

    userMatchedFinalRating.entries.forEach((e) => matchedList.add(matchedUser(e.key, e.value)));

    var mappedMatch = Map.fromIterable(matchedList, key: (e) => e.name, value: (e) => e.rating);

    print(mappedMatch);

    return mappedMatch;
  }

  int matchRating(preference, skill, yourPreference, yourSkill) {
    var matchPreference = preference;
    var matchSkill = skill;
    var yourMatchPreference = yourPreference;
    var yourMatchSkill = yourSkill;
    var matchCount = 0;

    if (matchPreference == yourMatchPreference) {
      matchCount++;
    } else {
      matchCount--;
    }

    if (matchSkill == yourMatchSkill) {
      matchCount++;
    } else {
      matchCount--;
    }

    return matchCount;
  }
}

class matchedUser {
  String name;
  String rating;

  matchedUser(this.name, this.rating);

  // @override
  // String toString() {
  //   return '{ ${this.name}, ${this.rating} }';
  // }
}

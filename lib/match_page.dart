import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'home_page.dart';
import 'main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'match_hiking_page.dart';
import 'match_bike_page.dart';
import 'match_run_page.dart';
import 'matches.dart';


class Activity {
  final int? preference;
  final int? skill;
  final int? group;

  const Activity({
    this.preference,
    this.skill,
    this.group
  });

  toJson() {
    return {"preference": this.preference, "skill": this.skill,
      "group": this.group};
  }

  factory Activity.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document){
    final data = document.data()!;
    return Activity(
      preference: data["preference"],
      skill: data["skill"],
      group: data["group"],
    );
  }
}

//TODO update in matching backend task
// class UserRating {
//
//   Future<void> GetUserRating(username, activity) async {
//     final _db = FirebaseFirestore.instance;
//     final snapshot  = await _db.collection("AdventureRatings")
//       .doc(username).collection("MyAdventureRatings")
//       .doc(activity).get();
//
//   print(snapshot.data());
//   print("here");
//
//   }
// }
// FirebaseFirestore db = FirebaseFirestore.instance;


void main() => runApp(const MyMatches());

class MyMatches extends StatelessWidget {
  const MyMatches({super.key});

  static const String _title = 'Matches';
  final matchedHikingTab = true;
  final matchedBikeTab = false;
  final matchedRunTab = false;

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = TextButton.styleFrom(
      foregroundColor: Theme.of(context).colorScheme.onPrimary,
    );

    //TODO update in matching backend task
    // CollectionReference ratingRef =
    //   FirebaseFirestore.instance.collection('AdventureRatings');
    // Future<void> getData() async {
    //   // Get docs from collection reference
    //   QuerySnapshot querySnapshot = await ratingRef.get();
    //   // Get data from docs and convert map to List
    //   final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    //   print(allData);
    // }
    return DefaultTabController(
    length: 1,
    child: Scaffold(
        appBar: AppBar(
          title: const Text('Matches'),
          actions: <Widget>[
            const IconButton(
              onPressed: null,
              icon: Icon(Icons.undo_outlined),
            ),
            const IconButton(
              onPressed: null,
              icon: Icon(Icons.tune_outlined),
            ),
          ],
            bottom: TabBar(
                    tabs: [
                      Tab(icon: Icon(Icons.hiking_outlined)),
                    ],
                  ),
                ),
                body: TabBarView(
                  children: [
                    matchedHikingTab == false ? Icon(Icons.hiking_outlined, size: 350) : const MyMatchHiking(),
                  ],
                ),
              ),
            );
    //  body: const Center(
       // child: MyMatchesWidget(),
     //   );
  }
}

class MyMatchHiking extends StatelessWidget {
  const MyMatchHiking({super.key});

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
        home: MatchHikingPage(),
      ),
    );
  }
}
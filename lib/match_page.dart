import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';


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

class UserRating {

  Future<void> GetUserRating(username, activity) async {
    final _db = FirebaseFirestore.instance;
    final snapshot  = await _db.collection("AdventureRatings")
      .doc(username).collection("MyAdventureRatings")
      .doc(activity).get();

  print(snapshot.data());
  print("here");

  }
}
FirebaseFirestore db = FirebaseFirestore.instance;


void main() => runApp(const MyMatches());




class MyMatches extends StatelessWidget {
  const MyMatches({super.key});

  static const String _title = 'Matches';



  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = TextButton.styleFrom(
      foregroundColor: Theme.of(context).colorScheme.onPrimary,
    );
    CollectionReference ratingRef =
      FirebaseFirestore.instance.collection('AdventureRatings');
    Future<void> getData() async {
      // Get docs from collection reference
      QuerySnapshot querySnapshot = await ratingRef.get();
      // Get data from docs and convert map to List
      final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
      print(allData);
    }
    return DefaultTabController(
    length: 4,
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
                      Tab(icon: Icon(Icons.directions_bike_outlined)),
                      Tab(icon: Icon(Icons.directions_run_outlined)),
                      Tab(icon: Icon(Icons.downhill_skiing_outlined)),
                    ],
                  ),
                ),
                body: TabBarView(
                  children: [
                    Icon(Icons.hiking_outlined, size: 350),
                    Icon(Icons.directions_bike_outlined, size: 350),
                    Icon(Icons.directions_run_outlined, size: 350),
                    Icon(Icons.downhill_skiing_outlined, size: 350),
                  ],
                ),
              ),
            );
    //  body: const Center(
       // child: MyMatchesWidget(),
     //   );
  }
}


import 'package:cloud_firestore/cloud_firestore.dart';

class AccountSignIn {

  Future<bool> bikingRating(username, password) async {

    final CollectionReference accountCollection =
    FirebaseFirestore.instance.collection('Accounts');

    var test = await accountCollection
        .where("username", isEqualTo: username)
        .where("password", isEqualTo: password)
        .get().then((value) => value.size > 0 ? true : false);

    if(test == true){
      return true;
    } else {
      return false;
    }
  }

  Future<bool> hikingRating(username, password) async {

    final CollectionReference hikingRatingCollection =
    FirebaseFirestore.instance.collection('AdventureRatings');

    var test = await hikingRatingCollection
        .where("preference", isEqualTo: 5)
        .get().then((value) => value.size > 0 ? true : false);

    if(test == true){
      return true;
    } else {
      return false;
    }
  }

  Future<bool> runningRating(username, password) async {

    final CollectionReference accountCollection =
    FirebaseFirestore.instance.collection('Accounts');

    var test = await accountCollection
        .where("username", isEqualTo: username)
        .where("password", isEqualTo: password)
        .get().then((value) => value.size > 0 ? true : false);

    if(test == true){
      return true;
    } else {
      return false;
    }
  }

  Future<bool> skiingRating(username, password) async {

    final CollectionReference accountCollection =
    FirebaseFirestore.instance.collection('Accounts');

    var test = await accountCollection
        .where("username", isEqualTo: username)
        .where("password", isEqualTo: password)
        .get().then((value) => value.size > 0 ? true : false);

    if(test == true){
      return true;
    } else {
      return false;
    }
  }

}
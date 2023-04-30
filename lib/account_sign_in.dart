import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AccountSignIn {
  // String globalAccountUsername = '';
  //
  Future<bool> accountSignIn(username, password) async {
  //
  //   final CollectionReference accountCollection =
  //   FirebaseFirestore.instance.collection('Accounts');
  //
  //   var test = await accountCollection
  //       .where("username", isEqualTo: username)
  //       .where("password", isEqualTo: password)
  //       .get().then((value) => value.size > 0 ? true : false);


  //TODO: implement FireBase auth lib instead of custom
  var test = false;
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: username.trim(),
      password: password.trim());
    } on FirebaseAuthException catch (e) {
      print(e);
      return false;
    }
  return true;

  }

  // set setglobalAccountUsername(username) {
  //   final globalAccountUsername = username;
  // }
  //
  // String get getglobalAccountUsername {
  //   return globalAccountUsername;
  // }
}


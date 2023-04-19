import 'package:cloud_firestore/cloud_firestore.dart';

class AccountSignIn {
  String globalAccountUsername = '';

  Future<bool> accountSignIn(username, password) async {

    final CollectionReference accountCollection =
    FirebaseFirestore.instance.collection('Accounts');

    var test = await accountCollection
        .where("username", isEqualTo: username)
        .where("password", isEqualTo: password)
        .get().then((value) => value.size > 0 ? true : false);

    if(test == true){
      setglobalAccountUsername = username;
      return true;
    } else {
      return false;
    }
  }

  set setglobalAccountUsername(username) {
    final globalAccountUsername = username;
  }

  String get getglobalAccountUsername {
    return globalAccountUsername;
  }
}


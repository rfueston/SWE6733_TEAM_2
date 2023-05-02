// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'dart:async';
//
class MessageFeature {
//
//
//   Future<void> init() async {
//     await Firebase.initializeApp(
//         options: DefaultFirebaseOptions.currentPlatform);
//
//     FirebaseUIAuth.configureProviders([
//       EmailAuthProvider(),
//     ]);
//
//     FirebaseAuth.instance.userChanges().listen((user) {
//       if (user != null) {
//         _loggedIn = true;
//         _guestBookSubscription = FirebaseFirestore.instance
//             .collection('guestbook')
//             .orderBy('timestamp', descending: true)
//             .snapshots()
//             .listen((snapshot) {
//           _guestBookMessages = [];
//           for (final document in snapshot.docs) {
//             _guestBookMessages.add(
//               GuestBookMessage(
//                 name: document.data()['name'] as String,
//                 message: document.data()['text'] as String,
//               ),
//             );
//           }
//           notifyListeners();
//         });
//       } else {
//         _loggedIn = false;
//         _guestBookMessages = [];
//         _guestBookSubscription?.cancel();
//       }
//       notifyListeners();
//     });
//   }
//
//
}

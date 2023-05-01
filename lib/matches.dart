import 'package:cloud_firestore/cloud_firestore.dart';

class Matches {
  Future<bool> bikingRating(username, password) async {
    return false;
  }

  Future<bool> hikingRating(username, password) async {
    return false;
  }

  Future<bool> runningRating(username, password) async {
    return false;
  }

  Future<bool> skiingRating(username, password) async {
    return false;
  }

  void findMatching() {

    // I(P1, P2) = 3.5(ap1 - ap2) + 2.5(bp1 - bp2) + 2(cp1 - cp2) + (dp1 - dp2) + (ep1 - ep2)

  }

  void findPercentMatch() {

    // I(pMax, pMin) = 3.5(5) + 2.5(5) + 2(5) +5 +5
    // I(pMax, pMin) = 50
    //
    // 100/50 =2
    //
    // 100 - (50 * 2) = 0.0% match

  }
}

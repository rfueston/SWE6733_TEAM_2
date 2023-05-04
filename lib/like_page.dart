//import 'dart:io';
import 'package:flutter/material.dart';
import 'match_hiking_page.dart';

// import 'package:flutter/foundation.dart';
// import 'home_page.dart';
// //import 'main.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'matches.dart';
// import 'like_page.dart';
// import 'dart:io';

class UserDetailsPage extends StatelessWidget {
  final User user;

  const UserDetailsPage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(user.name)),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(user.photoUrl),
          SizedBox(height: 16),
          Text(user.bio),
          SizedBox(height: 16),
          Text('Rating: ${user.rating}'),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'matching_users_page.dart';

class LikedPage extends StatelessWidget {
  final User user;

  LikedPage({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(user.photoUrl),
            Text(user.bio),
          ],
        ),
      ),
    );
  }
}

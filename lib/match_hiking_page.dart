import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'home_page.dart';
import 'main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'matches.dart';


class MatchHikingPage extends StatefulWidget {
  const MatchHikingPage({super.key});

  @override
  State<MatchHikingPage> createState() => _MyMatchHikingPage();
}

class _MyMatchHikingPage extends State<MatchHikingPage> {
  Future<void> _addMatchedUser() async {
    //logic to add matched user to friends list
  }

  final matchingUsers = Matches().getMyAdventureMatch();

  int _currentIndex = 0;
  List<User> _matchingUsers = [
    User(
      name: 'testuser3@email.com',
      photoUrl: '/Users/rfueston/IdeaProjects/SWE6733_TEAM_2_AdventureQuest/Assests/0.jpg',
      rating: '2',
      bio: 'I love hiking and exploring new places!',
    ),
    User(
      name: 'testuser4@email.com',
      photoUrl: '/Users/rfueston/IdeaProjects/SWE6733_TEAM_2_AdventureQuest/Assests/1.jpg',
      rating: '-6',
      bio: 'I love hiking',
    ),
    User(
      name: 'testuser5@email.com',
      photoUrl: '/Users/rfueston/IdeaProjects/SWE6733_TEAM_2_AdventureQuest/Assests/5.jpg',
      rating: '-2',
      bio: 'I love exploring new places!',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Matching Users')),
      body: _matchingUsers.isNotEmpty
          ? _buildCarouselSlider()
          : _buildLoadingIndicator(),
    );
  }

  Widget _buildCarouselSlider() {
    return SingleChildScrollView(
      child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CarouselSlider(
          key: UniqueKey(),
          options: CarouselOptions(
            height: 400,
            viewportFraction: 0.8,
            initialPage: _currentIndex,
            enableInfiniteScroll: false,
            reverse: false,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          items: _matchingUsers.map((user) {
            return Builder(
              builder: (BuildContext context) {
                return Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(user.name),
                      Image.asset(user.photoUrl),
                      // Image.network(user.photoUrl),
                      Text(user.bio),
                      Text(user.rating),
                    ],
                  ),
                );
              },
            );
          }).toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                _swipeLeft();
              },
              child: Text('Nope'),
            ),
            SizedBox(width: 16),
            ElevatedButton(
              onPressed: () {
                _swipeRight();
              },
              child: Text('Like'),
            ),
          ],
        ),
      ],
    ),
    );
  }

  void _swipeLeft() {
    setState(() {
      if (_currentIndex > 0) {
        _currentIndex--;
      } else {
        // If we're at the first user, loop around to the last user
        _currentIndex = _matchingUsers.length - 1;
      }
    });
  }

  // void _swipeRight() {
  //   setState(() {
  //     if (_currentIndex < _matchingUsers.length - 1) {
  //       _currentIndex++;
  //     } else {
  //       // If we're at the last user, loop around to the first user
  //       _currentIndex = 0;
  //     }
  //   });
  // }

  void _swipeRight() {
    // setState(() {
    //   if (_currentIndex < _matchingUsers.length - 1) {
    //     _currentIndex++;
    //   } else {
    //     // If we're at the last user, loop around to the first user
    //     _currentIndex = 0;
    //   }
    // });
    //
    // // Navigate to the ProfilePage with the selected user
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //       builder: (context) => LikedPage(user:
    //       _matchingUsers[_currentIndex])),
    // );
  }

  Widget _buildLoadingIndicator() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}

class User {
  final String name;
  final String photoUrl;
  final String rating;
  final String bio;

  User({
    required this.name,
    required this.photoUrl,
    required this.rating,
    required this.bio,
  });
}

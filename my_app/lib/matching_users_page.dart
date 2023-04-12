import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'liked_page.dart';
// import 'main.dart';

class MatchingUsersPage extends StatefulWidget {
  @override
  _MatchingUsersPageState createState() => _MatchingUsersPageState();
}

class _MatchingUsersPageState extends State<MatchingUsersPage> {
  int _currentIndex = 0;
  List<User> _matchingUsers = [
    User(
      name: 'Alice',
      photoUrl: 'https://randomuser.me/api/portraits/women/67.jpg',
      bio: 'I love hiking and exploring new places!',
    ),
    User(
      name: 'Bob',
      photoUrl: 'https://randomuser.me/api/portraits/men/67.jpg',
      bio: 'I enjoy cycling and long rides in the countryside.',
    ),
    User(
      name: 'Charlie',
      photoUrl: 'https://randomuser.me/api/portraits/men/22.jpg',
      bio: 'I love swimming and anything to do with the water.',
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
    return Column(
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
                      Image.network(user.photoUrl),
                      Text(user.bio),
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
    setState(() {
      if (_currentIndex < _matchingUsers.length - 1) {
        _currentIndex++;
      } else {
        // If we're at the last user, loop around to the first user
        _currentIndex = 0;
      }
    });

    // Navigate to the ProfilePage with the selected user
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => LikedPage(user: _matchingUsers[_currentIndex])),
    );
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
  final String bio;

  User({
    required this.name,
    required this.photoUrl,
    required this.bio,
  });
}

import 'package:flutter/material.dart';
import 'package:myapp/screens/meeting/join_meeting.dart';
import 'package:myapp/screens/meeting/meeting.dart';
import 'package:myapp/screens/profile/view_profile.dart';
import 'package:myapp/services/authentication/authentication.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  _DashBoardState createState() => _DashBoardState();
}

List widgets = [
  MeetingMenu(),
  ViewProfilePage(),
];

class _DashBoardState extends State<DashBoard> {
  var _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgets[_currentIndex],
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        items: [
          /// Home
          SalomonBottomBarItem(
            icon: Icon(
              Icons.meeting_room,
            ),
            title: Text("Meeting"),
            selectedColor: Colors.purple,
          ),

          /// Likes

          /// Profile
          SalomonBottomBarItem(
            icon: Icon(Icons.person),
            title: Text("Profile"),
            selectedColor: Colors.teal,
          ),
        ],
      ),
    );
  }
}

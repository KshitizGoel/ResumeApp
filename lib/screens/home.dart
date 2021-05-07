import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:my_resume/screens/dashboard.dart';
import 'package:my_resume/screens/skills.dart';
import 'package:my_resume/widgets/decorations.dart';

import 'education.dart';
import 'experience.dart';
import 'media.dart';

class HomeScreen extends StatefulWidget {
  var _indexPassed;

  HomeScreen(this._indexPassed);

  @override
  _HomeScreenState createState() => _HomeScreenState(_indexPassed);
}

class _HomeScreenState extends State<HomeScreen> {
  var _indexPassed;

  _HomeScreenState(this._indexPassed);

  var _currentIndex;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _currentIndex = _indexPassed;
  }

  final List<Widget> _children = [
    Dashboard(),
    EducationSet(),
    ExperienceSet(),
    SkillSet(),
    MediaPage()
  ];

  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        elevation: 0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(AntDesign.dashboard, color: fCL),
            title: Text(
              "Dashboard",
              style: TextStyle(color: fCD),
            ),
            backgroundColor: mC,
          ),
          BottomNavigationBarItem(
              icon: Icon(MaterialIcons.school, color: fCL),
              title: Text(
                "Education",
                style: TextStyle(color: fCD),
              ),
              backgroundColor: mC),
          BottomNavigationBarItem(
              icon: Icon(MaterialIcons.developer_board, color: fCL),
              title: Text(
                "Experience",
                style: TextStyle(color: fCD),
              ),
              backgroundColor: mC),
          BottomNavigationBarItem(
              icon: Icon(MaterialIcons.laptop_mac, color: fCL),
              title: Text(
                "Skills",
                style: TextStyle(color: fCD),
              ),
              backgroundColor: mC),
          BottomNavigationBarItem(
              icon: Icon(Icons.perm_media_outlined, color: fCL),
              title: Text(
                "Media",
                style: TextStyle(color: fCD),
              ),
              backgroundColor: mC),
        ],
        onTap: onTappedBar,
      ),
    );
  }
}

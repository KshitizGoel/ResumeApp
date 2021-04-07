import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:my_resume/screens/dashboard.dart';
import 'package:my_resume/screens/skills.dart';
import 'package:my_resume/widgets/decorations.dart';

import 'education.dart';
import 'experience.dart';

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
    ExperienceSet(),
    EducationSet(),
    SkillSet(),
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

            icon: Icon(MdiIcons.viewDashboard, color: fCL),
            title: Text(
              "Dashboard",
              style: TextStyle(color: Colors.black),
            ),
            backgroundColor: mC,
          ),
          BottomNavigationBarItem(
              icon: Icon(MdiIcons.school, color: fCL),
              title: Text(
                "Education",
                style: TextStyle(color: Colors.black),
              ),
              backgroundColor: mC),
          BottomNavigationBarItem(
              icon: Icon(MdiIcons.developerBoard, color: fCL),
              title: Text(
                "Work Experience",
                style: TextStyle(color: Colors.black),
              ),
              backgroundColor: mC),
          BottomNavigationBarItem(
              icon: Icon(MdiIcons.deskLamp, color: fCL),
              title: Text(
                "Skills",
                style: TextStyle(color: Colors.black),
              ),
              backgroundColor: mC),
        ],
        onTap: onTappedBar,
      ),
    );
  }
}

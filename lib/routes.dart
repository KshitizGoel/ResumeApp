import 'package:flutter/cupertino.dart';
import 'package:my_resume/screens/dashboard.dart';
import 'package:my_resume/screens/education.dart';
import 'package:my_resume/screens/experience.dart';
import 'package:my_resume/screens/skills.dart';

class Routes{
  Routes._();

  static const String dashboard = '/dashboard';
  static const String education = '/education';
  static const String skills = '/skills';
  static const String experience = '/experience';

  static final routes = <String, WidgetBuilder>{
    dashboard: (BuildContext context) => Dashboard(),
    education: (BuildContext context) => EducationSet(),
    skills: (BuildContext context) => SkillSet(),
    experience: (BuildContext context) => ExperienceSet(),

  };

}
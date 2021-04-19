import 'package:flutter/material.dart';
import 'package:my_resume/screens/authentication.dart';
 import 'package:my_resume/screens/home.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Authentication(),
    );
  }
}

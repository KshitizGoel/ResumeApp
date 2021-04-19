import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:my_resume/constants/urls.dart';
import 'package:my_resume/screens/home.dart';
import 'package:my_resume/widgets/buttons.dart';
import 'package:my_resume/widgets/decorations.dart';

class Authentication extends StatefulWidget {
  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mC,

      body: ListView(
        children: [
          Center(
            child : InkWell(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context){
                  return HomeScreen(0);
                }));
              },
              child: GeneralButton(
                down: false,
                icon: MdiIcons.google,

              ),
            ),

          )
        ],
      ),



    );
  }
}

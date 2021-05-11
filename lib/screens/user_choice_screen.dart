import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:my_resume/constants/texts.dart';
import 'package:my_resume/screens/authentication/authentication.dart';
import 'package:my_resume/widgets/buttons.dart';
import 'package:my_resume/widgets/cards.dart';
import 'package:my_resume/widgets/decorations.dart';

class UserChoice extends StatefulWidget {
  @override
  _UserChoiceState createState() => _UserChoiceState();
}

class _UserChoiceState extends State<UserChoice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mC,
      body: ListView(
        children: [
          Container(height: 100,),

          IntroCard(
            child : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20 , horizontal: 10),
                  child: Text(Texts.userChoiceStatement , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 20),),
                ),
              ],
            )
          ),
          Container(height: 50,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal : 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                 InkWell(
                  onTap: () {
                   },
                  child: UserChoiceButtons(
                    colors: fCR,
                    child: Column(
                      children: [
                        Icon(MaterialIcons.business_center , color: Colors.white,),
                        Text("Recruiter" , style: TextStyle(color: Colors.white),)
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return Authentication();
                    }));
                   },
                  child: UserChoiceButtons(
                    colors: fCB,
                    child: Column(
                      children: [
                        Icon(Icons.engineering , color: Colors.white),
                        Text("Job Seeker" , style: TextStyle(color: Colors.white),)
                      ],
                    ),
                  ),
                ),

              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:my_resume/widgets/decorations.dart';
 import 'package:my_resume/widgets/texts.dart';

class ExperienceSet extends StatefulWidget {
  @override
  _ExperienceSetState createState() => _ExperienceSetState();
}

class _ExperienceSetState extends State<ExperienceSet> {

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.08,
          ),
          Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: CustomTexts('Experience Set', true, 25, fCD),
              )),



        ],
      ),
    );
  }
}

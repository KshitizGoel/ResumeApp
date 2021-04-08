import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:my_resume/constants/texts.dart';
import 'package:my_resume/widgets/cards.dart';
import 'package:my_resume/widgets/decorations.dart';
import 'package:my_resume/widgets/texts.dart';

class EducationSet extends StatefulWidget {
  @override
  _EducationSetState createState() => _EducationSetState();
}

class _EducationSetState extends State<EducationSet> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: dtuCard(context),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40.0 , bottom: 10 ),
            child: bbpsCard(context),
          ),
        ],
      ),
    ));
  }

  Widget dtuCard(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Align(
                alignment: Alignment.topLeft,
                child: ImageCard(
                  true,
                  imagePath: "assets/images/dtu_image.png",
                )),
            Column(
              children: [
                Container(
                    child: CustomTexts(
                        'Delhi\nTechnological\nUniversity', true, 24, fCD)),
                Padding(
                  padding: const EdgeInsets.only(top : 5.0),
                  child: CustomTexts(
                      '2019 - 2023', false, 15, fCL),
                )
              ],
            )
          ],
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.08,),

        IntroCard(
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Software Engineering',
                        style: TextStyle(
                            color: fCD,
                            fontSize: 18,
                            fontWeight: FontWeight.w700)),
                    Icon(
                      MdiIcons.blenderSoftware,
                      color: fCD,
                    ),
                  ],
                ),
                SizedBox(height: 25),
                Text(Texts.introductoryStatement,
                    style: TextStyle(
                        color: fCD, fontSize: 15, fontWeight: FontWeight.w400)),
                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Nationality',
                            style: TextStyle(
                                color: fCL,
                                fontSize: 12,
                                fontWeight: FontWeight.w700)),
                        Text('Indian',
                            style: TextStyle(
                                color: fCD,
                                fontSize: 18,
                                fontWeight: FontWeight.w700)),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Date Of Birth',
                            style: TextStyle(
                                color: fCL,
                                fontSize: 12,
                                fontWeight: FontWeight.w700)),
                        Text('10 / 12 / 2000',
                            style: TextStyle(
                                color: fCD,
                                fontSize: 18,
                                fontWeight: FontWeight.w700)),
                      ],
                    ),
                  ],
                ),
              ],
            )),

      ],
    );
  }


  Widget bbpsCard(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Align(
                alignment: Alignment.topLeft,
                child: ImageCard(
                  true,
                  imagePath: "assets/images/bbpsrh_image.png",
                )),
            Column(
              children: [
                Container(
                    child: CustomTexts(
                        'Bal Bharati\nPublic School', true, 24, fCD)),
                Padding(
                  padding: const EdgeInsets.only(top : 5.0),
                  child: CustomTexts(
                      '2005 - 2019', false, 15, fCL),
                )
              ],
            )
          ],
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.08,),

        IntroCard(
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Non - Medical',
                        style: TextStyle(
                            color: fCD,
                            fontSize: 18,
                            fontWeight: FontWeight.w700)),
                    Icon(
                      Icons.engineering,
                      color: fCD,
                    ),
                  ],
                ),
                SizedBox(height: 25),
                Text(Texts.introductoryStatement,
                    style: TextStyle(
                        color: fCD, fontSize: 15, fontWeight: FontWeight.w400)),
                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Nationality',
                            style: TextStyle(
                                color: fCL,
                                fontSize: 12,
                                fontWeight: FontWeight.w700)),
                        Text('Indian',
                            style: TextStyle(
                                color: fCD,
                                fontSize: 18,
                                fontWeight: FontWeight.w700)),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Date Of Birth',
                            style: TextStyle(
                                color: fCL,
                                fontSize: 12,
                                fontWeight: FontWeight.w700)),
                        Text('10 / 12 / 2000',
                            style: TextStyle(
                                color: fCD,
                                fontSize: 18,
                                fontWeight: FontWeight.w700)),
                      ],
                    ),
                  ],
                ),
              ],
            )),

      ],
    );
  }
}

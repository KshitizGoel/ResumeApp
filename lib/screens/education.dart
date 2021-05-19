import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
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
    final double height = MediaQuery
        .of(context)
        .size
        .height;
    final double width = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
        backgroundColor: mC,

        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: dtuCard(context),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40.0, bottom: 10),
                child: bbpsCard(context),
              ),
            ],
          ),
        ));
  }

  Widget dtuCard(BuildContext context) {
    return EduCard(
        child: Column(
          children: <Widget>[
            Align(
                alignment: Alignment.center,
                child: ImageCard(
                  true,
                  imagePath: "assets/images/dtu_image.png",
                )),
            SizedBox(
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.05,
            ),
            Column(
              children: [
                Container(
                    child: CustomTexts(
                        'Delhi Technological University', true, 20, fCD)),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: CustomTexts('2019 - 2023', false, 15, fCL),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Software Engineering',
                    style: TextStyle(
                        color: fCD, fontSize: 18, fontWeight: FontWeight.w700)),
                Icon(
                  AntDesign.staro,
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
        ));
  }

  Widget bbpsCard(BuildContext context) {
    return EduCard(
        child: Column(
          children: <Widget>[
            Align(
                alignment: Alignment.center,
                child: ImageCard(
                  true,
                  imagePath: "assets/images/bbpsrh_image.png",
                )),
            SizedBox(
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.05,
            ),
            Column(
              children: [
                Container(
                    child: CustomTexts(
                        'Bal Bharati Public School', true, 20, fCD)),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: CustomTexts('2005 - 2019', false, 15, fCL),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Non - Medical',
                    style: TextStyle(
                        color: fCD, fontSize: 18, fontWeight: FontWeight.w700)),
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
        ));
  }
}

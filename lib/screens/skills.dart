import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:my_resume/widgets/cards.dart';
import 'package:my_resume/widgets/decorations.dart';
import 'package:my_resume/widgets/texts.dart';

class SkillSet extends StatefulWidget {
  @override
  _SkillSetState createState() => _SkillSetState();
}

class _SkillSetState extends State<SkillSet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mC,
      body: ListView(
        children: [
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   children: [
          //     publishingCards(),
          //     publishingCards(),
          //   ],
          // ),
          SizedBox(
            height: 40,
          ),

          languagesCards(context, "Flutter", "1.5 Years"),
          SizedBox(
            height: 40,
          ),
          languagesCards(context, "Android", "1 Year"),

        ],
      ),
    );
  }

  Widget languagesCards(
      BuildContext context, String frameworkName, String experienceYears) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
      child: SkillCard(
        down: false,
        childWidget: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: LeadingIconCard(
                false,
                imagePath: "assets/images/profile_image.jpg",
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 15),
              child: IntroCard(
                child:
                    skillDescription(context, frameworkName, experienceYears),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget skillDescription(
      BuildContext context, String framework, String experienceInYears) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Framework",
              style: TextStyle(fontWeight: FontWeight.bold, color: fCD),
            ),
            Text(
              framework,
              style: TextStyle(fontWeight: FontWeight.bold, color: fCL),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Experience",
                style: TextStyle(fontWeight: FontWeight.bold, color: fCD),
              ),
              Text(
                experienceInYears,
                style: TextStyle(fontWeight: FontWeight.bold, color: fCL),
              ),
            ],
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              MdiIcons.professionalHexagon,
              color: solidGreen,
              size: 30,
            ),
          ],
        )
      ],
    );
  }

  //Publishing Cards is the card for displaying the Hackathon or CodeChef
  // achievements and for now its not for use!!

  Widget publishingCards() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
      child: Container(
        width: 150,
        child: PublishingCard(
          down: true,
          childWidget: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12.0, horizontal: 15),
                child: IntroCard(
                  child: Text("Code Chef Rankings"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

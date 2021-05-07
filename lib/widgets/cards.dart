import 'package:flutter/material.dart';
import 'package:my_resume/widgets/decorations.dart';

class IntroCard extends StatelessWidget {
  final Widget child;

  IntroCard({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      decoration: nMboxInvert,
      child: child,
    );
  }
}


class InvertIntroCard extends StatelessWidget {
  final Widget child;

  InvertIntroCard({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      decoration: nMbox ,
      child: child,
    );
  }
}

class NMCard extends StatelessWidget {
  final bool active;
  final IconData icon;
  final String label;

  const NMCard({required this.active,required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.075,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 7),
      decoration: nMbox,
      child: Row(
        children: <Widget>[
          Icon(icon, color: fCL),
          SizedBox(width: 15),
          Text(
            label,
            style: TextStyle(
                color: fCD, fontWeight: FontWeight.w700, fontSize: 16),
          ),
          Spacer(),
          Container(
            decoration: active ? nMboxInvert : nMboxInvert,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.navigate_next),
            ),
          ),
        ],
      ),
    );
  }
}

class ImageCard extends StatelessWidget {
  final bool down;

  final String imagePath;

  ImageCard(this.down, {required this.imagePath});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Container(
      width: height * 0.2,
      height: width * 0.4,
      decoration: !down ? profileBoxInvert : profileBox,
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image.asset(
            imagePath,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}

class TimeLineCard extends StatelessWidget {
  final Widget child;

  TimeLineCard(this.child);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      decoration: nMboxInvert,
      child: child,
    );
  }
}

class EduCard extends StatelessWidget {
  final Widget child;

  EduCard({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      decoration: nMEduboxInvert,
      child: child,
    );
  }
}

class LeadingIconCard extends StatelessWidget {
  final bool down;

  final String imagePath;



  LeadingIconCard(this.down, {required this.imagePath});

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: !down ? profileBoxInvert : profileBox,
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image.asset(
            imagePath,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}

class SkillCard extends StatelessWidget {
  final bool down;
  final Widget childWidget;

  const SkillCard({required this.down,required this.childWidget});

  @override
  Widget build(BuildContext context) {
    return Container(
      //width: ,
      height: 100,
      decoration: down ? nMboxInvert : nMbox,
      child: childWidget,
    );
  }
}


class PublishingCard extends StatelessWidget {
  final bool down;
  final Widget childWidget;

   PublishingCard({required this.down, required this.childWidget});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 100,

      decoration: down ? nMbox : nMboxInvert ,
      child: childWidget,
    );
  }
}

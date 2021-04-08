import 'package:flutter/material.dart';
import 'package:my_resume/assets.dart';
import 'package:my_resume/widgets/decorations.dart';

class IntroCard extends StatelessWidget {
  final Widget child;

  IntroCard({this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      decoration: nMboxInvert,
      child: child,
    );
  }
}

class NMCard extends StatelessWidget {
  final bool active;
  final IconData icon;
  final String label;

  const NMCard({this.active, this.icon, this.label});

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

  ImageCard(this.down, {this.imagePath});

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
  final bool down;
  final IconData icon;
  final String webUrl;
  const EduCard({this.down, this.icon , this.webUrl});
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 55,
        height: 55,
        decoration: down ? nMboxInvert : nMbox,
        child: Icon(
          icon,
          color: down ? fCL : fCD,
        ),
      ) ;
  }
}

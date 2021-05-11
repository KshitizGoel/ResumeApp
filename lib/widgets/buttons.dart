import 'package:flutter/material.dart';
import 'package:my_resume/screens/video_player.dart';
import 'package:my_resume/screens/web_view.dart';
import 'package:my_resume/widgets/decorations.dart';
import 'package:my_resume/widgets/texts.dart';

class NMButton extends StatelessWidget {
  final bool down;
  final IconData icon;
  final String webUrl;

  const NMButton({required this.down,required this.icon, required this.webUrl});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return WebViewPage(webUrl);
        }));
      },
      child: Container(
        width: 55,
        height: 55,
        decoration: down ? nMboxInvert : nMbox,
        child: Icon(
          icon,
          color: down ? fCL : fCD,
        ),
      ),
    );
  }
}

class VideoPlayerButton extends StatelessWidget {
  final bool down;
  final IconData icon;
  final String videoName;
  final String vidId;

  const VideoPlayerButton({required this.down, required this.icon, required this.videoName,required this.vidId});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return VideoPlayer(vidId);
        }));
      },
      child: Container(
        decoration: down ? nMboxInvert : nMbox,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: down ? fCL : fCD,
              ),
              CustomTexts(" Video 1", false, 18, fCD)
            ],
          ),
        ),
      ),
    );
  }
}

class GeneralButton extends StatelessWidget {
  final IconData icon;
  final Color colors;
  const GeneralButton({required this.colors , required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: colors,
          boxShadow: [
            BoxShadow(
              color: mCD,
              offset: Offset(10, 10),
              blurRadius: 10,
            ),
            BoxShadow(
              color: mCL,
              offset: Offset(-10, -10),
              blurRadius: 10,
            ),
          ]),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}

class UserChoiceButtons extends StatelessWidget {
   final Color colors;
   final Widget child ;
  const UserChoiceButtons({required this.colors  , required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: colors,
          boxShadow: [
            BoxShadow(
              color: mCD,
              offset: Offset(10, 10),
              blurRadius: 10,
            ),
            BoxShadow(
              color: mCL,
              offset: Offset(-10, -10),
              blurRadius: 10,
            ),
          ]),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: child,
      ),
    );
  }
}

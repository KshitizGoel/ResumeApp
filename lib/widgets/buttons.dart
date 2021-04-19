import 'package:flutter/material.dart';
import 'package:my_resume/screens/video_player.dart';
import 'package:my_resume/screens/web_view.dart';
import 'package:my_resume/widgets/decorations.dart';
import 'package:my_resume/widgets/texts.dart';

class NMButton extends StatelessWidget {
  final bool down;
  final IconData icon;
  final String webUrl;

  const NMButton({this.down, this.icon, this.webUrl});

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

  const VideoPlayerButton({this.down, this.icon, this.videoName, this.vidId});

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
  final bool down;
  final IconData icon;
  const GeneralButton({this.down, this.icon });

  @override
  Widget build(BuildContext context) {
    return   Container(
        width: 55,
        height: 55,
        decoration: down ? nMboxInvert : nMbox,
        child: Icon(
          icon,
          color: down ? fCL : fCD,
        ),
     );
  }
}

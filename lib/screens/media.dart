
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:my_resume/constants/urls.dart';
import 'package:my_resume/widgets/buttons.dart';
import 'package:my_resume/widgets/decorations.dart';

class MediaPage extends StatefulWidget {
  @override
  _MediaPageState createState() => _MediaPageState();
}

class _MediaPageState extends State<MediaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mC,
      body: ListView(
        children: [

          Text("Video Resume"),


          SizedBox(height: 40,),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal :20.0 , vertical: 40),
            child: NMButton(
              down: false,
              icon: MdiIcons.pdfBox,
              webUrl: UrlConstants.githubUrl,
            ),
          ),


          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child:
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                NMButton(
                  down: false,
                  icon: MdiIcons.googlePlay,
                  webUrl: UrlConstants.githubUrl,
                ),
                NMButton(
                  down: false,
                  icon: MdiIcons.appleIos,
                  webUrl: UrlConstants.linkedInUrl,
                ),
                NMButton(
                  down: false,
                  icon: MdiIcons.web,
                  webUrl: UrlConstants.instagramUrl,
                ),
                NMButton(
                  down: false,
                  icon: MdiIcons.linkPlus,
                  webUrl: UrlConstants.facebookUrl,
                ),
              ],
            ),

          ),

          SizedBox(height: 40,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               VideoPlayerButton(
                  down: false,
                  icon: MdiIcons.video,
                  vidId: '8rUN1SAYNEE',
               ),
               VideoPlayerButton(
                  down: false,
                  icon: MdiIcons.video,
                  vidId: '8rUN1SAYNEE',
               ),
            ],
          ),
          SizedBox(height: 40,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               VideoPlayerButton(
                  down: false,
                  icon: MdiIcons.video,
                  vidId: '8rUN1SAYNEE',
               ),
               VideoPlayerButton(
                  down: false,
                  icon: MdiIcons.video,
                  vidId: '8rUN1SAYNEE',
               ),
            ],
          ),

        ],
      ),
    );
  }
}

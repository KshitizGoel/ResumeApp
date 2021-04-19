import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:my_resume/constants/urls.dart';
import 'package:my_resume/widgets/buttons.dart';
import 'package:my_resume/widgets/decorations.dart';
import 'package:my_resume/widgets/texts.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MediaPage extends StatefulWidget {
  @override
  _MediaPageState createState() => _MediaPageState();
}

class _MediaPageState extends State<MediaPage> {

  YoutubePlayerController _controller;
  TextEditingController _idController;
  TextEditingController _seekToController;

  String videoId = 'u71QsZvObHs';

  PlayerState _playerState;
  YoutubeMetaData _videoMetaData;
  double _volume = 100;
  bool _muted = true;
  bool _isPlayerReady = false;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: false,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    )..addListener(listener);
    _idController = TextEditingController();
    _seekToController = TextEditingController();
    _videoMetaData = const YoutubeMetaData();
    _playerState = PlayerState.unknown;
  }

  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {
        _playerState = _controller.value.playerState;
        _videoMetaData = _controller.metadata;
      });
    }
  }

  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    _idController.dispose();
    _seekToController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
        onExitFullScreen: () {
          // The player forces portraitUp after exiting fullscreen. This overrides the behaviour.
          SystemChrome.setPreferredOrientations(DeviceOrientation.values);
        },
        player: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
          progressIndicatorColor: fCL,
          topActions: <Widget>[
            const SizedBox(width: 8.0),
            Expanded(
              child: Text(
                _controller.metadata.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
            IconButton(
              icon: const Icon(
                Icons.settings,
                color: Colors.white,
                size: 25.0,
              ),
              onPressed: () {
                log('Settings Tapped!');
              },
            ),
          ],
          onReady: () {
            _isPlayerReady = false;
          },
          onEnded: (data) {
            // _controller
            //     .load(_ids[(_ids.indexOf(data.videoId) + 1) % _ids.length]);
            _showSnackBar('Video Ended!');
          },
        ),
        builder: (context, player) => Scaffold(
              backgroundColor: mC,
              body: ListView(
                children: [
                  player,
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal : 20.0),
                    child: CustomTexts("Video Resume", true, 20, fCD),
                  ),

                  //Button for downloading the PDF..


                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 40),
                    child: NMButton(
                      down: false,
                      icon: MdiIcons.pdfBox,
                      webUrl: UrlConstants.githubUrl,
                    ),
                  ),

                  //Buttons for the Google Play Store , App store hosted website etc..

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
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
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
            ));
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 16.0,
          ),
        ),
        backgroundColor: fCL,
        behavior: SnackBarBehavior.floating,
        elevation: 1.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
      ),
    );
  }
}

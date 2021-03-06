import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:my_resume/constants/texts.dart';
import 'package:my_resume/constants/urls.dart';
import 'package:my_resume/widgets/buttons.dart';
import 'package:my_resume/widgets/cards.dart';
import 'package:my_resume/widgets/decorations.dart';
import 'package:my_resume/widgets/texts.dart';

class Dashboard extends StatelessWidget {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: mC,
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: mC,
        centerTitle: false,
        leading: IconButton(
          onPressed: () {
            _scaffoldKey.currentState.openDrawer();
          },
          icon: Icon(
            Icons.menu,
            color: fCD,
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            Image(
              image: NetworkImage(UrlConstants.drawerImageUrl),
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: ListView(
          children: <Widget>[
            Center(
                child: ImageCard(
              true,
              imagePath: "assets/images/profile_image.jpg",
            )),
            SizedBox(
              height: 50,
            ),
            Center(child: CustomTexts('Kshitiz Goel', true, 30, fCD)),
            Center(
                child: CustomTexts('DTU Software Engineering \'23', false, 15, fCD)),
            SizedBox(
              height: 20,
            ),

            Center(child: CustomTexts('Mobile App Developer', true, 18, fCL)),
            SizedBox(
              height: height * 0.05,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                NMButton(
                  down: false,
                  icon: MdiIcons.github,
                  webUrl: UrlConstants.githubUrl,
                ),
                NMButton(
                  down: false,
                  icon: MdiIcons.linkedin,
                  webUrl: UrlConstants.linkedInUrl,
                ),
                NMButton(
                  down: false,
                  icon: MdiIcons.instagram,
                  webUrl: UrlConstants.instagramUrl,
                ),
                NMButton(
                  down: false,
                  icon: MdiIcons.facebook,
                  webUrl: UrlConstants.facebookUrl,
                ),
              ],
            ),
            SizedBox(
              height: height * 0.08,
            ),

            IntroCard(
                child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Ola Amigo !',
                        style: TextStyle(
                            color: fCD,
                            fontSize: 18,
                            fontWeight: FontWeight.w700)),
                    Icon(
                      MdiIcons.humanGreeting,
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

            // NMCard(
            //   active: true,
            //   icon: MdiIcons.school,
            //   label: 'Education',
            // ),
            // SizedBox(height: 30,),
            //
            // NMCard(
            //   active: true,
            //   icon: Icons.work,
            //   label: 'Mobile App Developer',
            // ),
            // SizedBox(height: 30,),
            //
            // NMCard(
            //   active: true,
            //   icon: MdiIcons.timerSand,
            //   label: 'Experience',
            // ),
          ],
        ),
      ),
    );
  }
}

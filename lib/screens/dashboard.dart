import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:my_resume/constants/texts.dart';
import 'package:my_resume/constants/urls.dart';
import 'package:my_resume/screens/authentication.dart';
import 'package:my_resume/widgets/buttons.dart';
import 'package:my_resume/widgets/cards.dart';
import 'package:my_resume/widgets/decorations.dart';
import 'package:my_resume/widgets/texts.dart';

class Dashboard extends StatelessWidget {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: <String>[
      'email',
    ],
  );

  Future<dynamic> loggingOutTheUser(BuildContext context) async {
    _googleSignIn.disconnect();
    print("Logging out the user!!!!");
    Navigator.of(context).push(MaterialPageRoute(builder: (context){
      return Authentication();
    }));
  }

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
        actions: [
          IconButton(
              icon: Icon(MdiIcons.logout , color: fCD,), onPressed:()=> loggingOutTheUser(context))
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IntroCard(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 15),
                      child: Container(
                        height: 75,
                        child: LeadingIconCard(
                          true,
                          imagePath: "assets/images/profile_image.jpg",
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          "Kshitiz Goel",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Software Department",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: fCL),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              title: Text("Student Bio"),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            ListTile(
              title: Text("Achievements"),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
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
                child: CustomTexts(
                    'DTU Software Engineering \'23', false, 15, fCD)),
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
                    Text('Hello World!',
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
          ],
        ),
      ),
    );
  }
}

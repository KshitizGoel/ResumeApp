import "package:http/http.dart" as http;
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:my_resume/screens/home.dart';
import 'package:my_resume/widgets/buttons.dart';
import 'package:my_resume/widgets/decorations.dart';
import 'dart:async';
import 'dart:convert' show json;

class Authentication extends StatefulWidget {
  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {

  //Asking about the permissions from the users like contacts , gallery etc..
  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: <String>[
      'email',
    ],
  );

  GoogleSignInAccount _currentUser;

  @override
  void initState() {
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) {
      setState(() {
        _currentUser = account;
      });
      if (_currentUser != null) {
        print("Auto Logging In The User!!!!!");
        print(_currentUser);
        navigatingToSignedInUser();
      }
    });
    _googleSignIn.signInSilently();
  }

  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }

  Future <dynamic> navigatingToSignedInUser() async{
    Navigator.of(context).push(MaterialPageRoute(builder: (context){
      return HomeScreen(0);
    }));
  }


  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.12,
            ),
            Text("Welcome"),
            Text(
              "Sign In",
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w900),
            ),
            SizedBox(
              height: 40.0,
            ),
            Text("Email"),
            SizedBox(
              height: 10.0,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Color(0XFFEFF3F6),
                  borderRadius: BorderRadius.circular(100.0),
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.1),
                        offset: Offset(6, 2),
                        blurRadius: 6.0,
                        spreadRadius: 3.0),
                    BoxShadow(
                        color: Color.fromRGBO(255, 255, 255, 0.9),
                        offset: Offset(-6, -2),
                        blurRadius: 6.0,
                        spreadRadius: 3.0)
                  ]),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20),
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: "Admin@live.com"),
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Text("Password"),
            SizedBox(
              height: 10.0,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Color(0XFFEFF3F6),
                  borderRadius: BorderRadius.circular(100.0),
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.1),
                        offset: Offset(6, 2),
                        blurRadius: 6.0,
                        spreadRadius: 3.0),
                    BoxShadow(
                        color: Color.fromRGBO(255, 255, 255, 0.9),
                        offset: Offset(-6, -2),
                        blurRadius: 6.0,
                        spreadRadius: 3.0)
                  ]),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Text("Forgot Password ?"),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Container(
                padding: EdgeInsets.all(15.0),
                child: Center(
                    child: Text(
                  "Log In",
                  style: TextStyle(color: Colors.white, fontSize: 16.0),
                )),
                decoration: BoxDecoration(
                    color: fCL,
                    borderRadius: BorderRadius.circular(100.0),
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
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Center(
              child: Text(
                "OR",
                style: TextStyle(
                    fontSize: 14.0, color: fCD, fontWeight: FontWeight.w900),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: _handleSignIn,
                  child: GeneralButton(
                    colors: fCR,
                    icon: MdiIcons.google,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return HomeScreen(0);
                    }));
                  },
                  child: GeneralButton(
                    colors: fCD,
                    icon: MdiIcons.github,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return HomeScreen(0);
                    }));
                  },
                  child: GeneralButton(
                    colors: fCB,
                    icon: MdiIcons.facebook,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return HomeScreen(0);
                    }));
                  },
                  child: GeneralButton(
                    colors: fCT,
                    icon: MdiIcons.twitter,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:my_resume/screens/home.dart';
import 'package:my_resume/services/firebase/phone_auth.dart';
import 'package:my_resume/widgets/buttons.dart';
import 'package:my_resume/widgets/decorations.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'dart:async';

import 'otp_verification.dart';

class Authentication extends StatefulWidget {
  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  //Asking about the permissions from the users like contacts , gallery etc..
  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: <String>[
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  GoogleSignInAccount _currentUser;

  TextEditingController phoneNumberController = TextEditingController();

  String autoFillPhoneNumber;


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

  Future<dynamic> navigatingToSignedInUser() async {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return HomeScreen(0);
    }));
  }

  final SmsAutoFill _autoFill = SmsAutoFill();

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: mC,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Mobile Number"),
                Icon(
                  MdiIcons.phone,
                  color: fCD,
                ),
              ],
            ),
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
                  controller: phoneNumberController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: "+91"),
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: InkWell(
                onTap: () async {
                  sendingTheOtp(phoneNumberController.text.toString());
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return OTPVerification();
                  }));
                },
                child: Container(
                  padding: EdgeInsets.all(15.0),
                  child: Center(
                      child: Text(
                    "Send OTP",
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

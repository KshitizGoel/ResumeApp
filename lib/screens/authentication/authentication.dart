
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:my_resume/repository/firebase/phone_auth.dart';
import 'package:my_resume/screens/home.dart';
 import 'package:my_resume/widgets/buttons.dart';
import 'package:my_resume/widgets/decorations.dart';
import 'package:provider/provider.dart';
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
  PhoneAuthVerification phoneAuthVerification;


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    phoneAuthVerification = Provider.of<PhoneAuthVerification>(context); //didDe
  }


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

  Future<void> _handleGoogleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }

  static final FacebookLogin facebookSignIn = new FacebookLogin();

  String _message = 'Log in/out by pressing the buttons below.';

  Future<Null> _login() async {
    final FacebookLoginResult result = await facebookSignIn.logIn(['email']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final FacebookAccessToken accessToken = result.accessToken;
        _showMessage('''
         Logged in!
         
         Token: ${accessToken.token}
         User id: ${accessToken.userId}
         Expires: ${accessToken.expires}
         Permissions: ${accessToken.permissions}
         Declined permissions: ${accessToken.declinedPermissions}
         ''');
        break;
      case FacebookLoginStatus.cancelledByUser:
        _showMessage('Login cancelled by the user.');
        break;
      case FacebookLoginStatus.error:
        _showMessage('Something went wrong with the login process.\n'
            'Here\'s the error Facebook gave us: ${result.errorMessage}');
        break;
    }
  }

  void _showMessage(String message) {
    setState(() {
      _message = message;
    });
  }

  Future<dynamic> navigatingToSignedInUser() async {

    //Getting the credentials for the Google Sign In
    final GoogleSignInAuthentication googleAuth =
        await _currentUser.authentication;

    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return HomeScreen(0);
    }));

    return await FirebaseAuth.instance.signInWithCredential(credential);
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
            Text("Welcome" ,style: TextStyle(color: cAuth), ),
            Text(
              "Sign In",
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w900 , color: hCT),
            ),
            SizedBox(
              height: 40.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Mobile Number",style: TextStyle(color: cAuth),),
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
                    // BoxShadow(
                    //     color: Color.fromRGBO(255, 255, 255, 0.9),
                    //     offset: Offset(-6, -2),
                    //     blurRadius: 6.0,
                    //     spreadRadius: 3.0)
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
                  phoneAuthVerification.sendingTheOtp(phoneNumberController.text.toString());
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
                    style: TextStyle(color: Colors.white, fontSize: 16.0 , fontWeight : FontWeight.bold),
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
                  onTap: _handleGoogleSignIn,
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
                    _login();
                    // Navigator.of(context)
                    //     .push(MaterialPageRoute(builder: (context) {
                    //   return HomeScreen(0);
                    // }));
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

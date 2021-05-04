import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:my_resume/screens/authentication/authentication.dart';

//This class is for retrieving the data from the backend!


class GoogleAuth{

  GoogleSignInAccount currentUser;

//Asking about the permissions from the users like contacts , gallery etc..
  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: <String>[
      'email',
    ],
  );

//logging out the user from the App.
  Future<dynamic> loggingOutTheUser(BuildContext context) async {
    _googleSignIn.disconnect();
    print("Logging out the user!!!!");
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return Authentication();
    }));
  }



}
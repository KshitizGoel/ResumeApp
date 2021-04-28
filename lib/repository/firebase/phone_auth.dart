import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_resume/screens/dashboard.dart';

//  We are successfully authenticating my mobile Number.
//  We are sending the OTP to every mobile.
//  Minor Task : Navigating the user to next screen so that manual entry is allowed!
//  Take codeSent to next Screen and then get the sms code from there and change the smsCode!

class PhoneAuthVerification {


  Future <void> sendingTheOtp(String phoneNumber) async {

    String _verificationId;
    FirebaseAuth auth = FirebaseAuth.instance;

    try {
      await auth.verifyPhoneNumber(
        phoneNumber: "+91 " + phoneNumber,
        timeout: const Duration(seconds: 30),
        verificationCompleted: (PhoneAuthCredential credential) async {
          // ANDROID ONLY!

          // Sign the user in (or link) with the auto-generated credential
          await auth.signInWithCredential(credential);
          print("Executing the verificationCompleted Function");
        },
        verificationFailed: (FirebaseAuthException e) {
          if (e.code == 'invalid-phone-number') {
            print('The provided phone number is not valid.');
          }
          // Handle other errors
        },
        codeSent: (String verificationId, int resendToken) async {
          // Update the UI - wait for the user to enter the SMS code

          print("Executing the codeSent Function");

          _verificationId = verificationId;
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          // Auto-resolution timed out...
        },
      );
    } catch (e) {
      print("Getting the Error here! \n$e");
    }
  }

  PhoneAuthVerification();

  void verifyingTheOTP(String verificationCode, BuildContext context) async {
    String _verificationId;
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: _verificationId, smsCode: verificationCode);

      await auth.signInWithCredential(credential);

      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return Dashboard();
      }));

      print("Successfully Signed In!!!");
    } catch (e) {
      print("Getting the Error here! \n$e");
    }
  }
}
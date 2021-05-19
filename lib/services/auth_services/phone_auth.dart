import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:my_resume/screens/dashboard.dart';

//This class is for retrieving the data from the backend!

@Singleton()
class PhoneAuth {
  Future<String> sendingTheOtp(String phoneNumber) async {
    String _verificationId = " ";
    FirebaseAuth auth = FirebaseAuth.instance;

    try {
      await auth.verifyPhoneNumber(
        phoneNumber: "+91 " + phoneNumber,
        timeout: const Duration(seconds: 30),
        verificationCompleted: (PhoneAuthCredential credential) async {
          // ANDROID ONLY !Sign the user in (or link) with the auto-generated credential
          await auth.signInWithCredential(credential);
          print("Executing the verificationCompleted Function");
        },
        verificationFailed: (FirebaseAuthException e) {
          if (e.code == 'invalid-phone-number') {
            print('The provided phone number is not valid.');
          }
          // Handle other errors
        },
        codeSent: (String verificationId, resendToken) async {
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

    return _verificationId;
  }

  Future<void> verifyingTheOTP(String verificationCode) async {
    String _verificationId = '';
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: _verificationId, smsCode: verificationCode);

      await auth.signInWithCredential(credential);


      print("Successfully Signed In!!!");
    } catch (e) {
      print("Getting the Error here! \n$e");
    }
  }
}

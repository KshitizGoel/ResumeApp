import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


//We are successfully authenticating my mobile Number.
// We are sending the OTP to every mobile.
//Minor Task : Navigating the user to next screen so that manual entry is allowed!
// Take codeSent to next Screen and then get the sms code from there and change the smsCode!


void sendingTheOtp(String phoneNumber) async {
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
        String smsCode ='696969';

        print("Executing the codeSent Function");

        // Create a PhoneAuthCredential with the code
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
            verificationId: verificationId, smsCode: smsCode);

        print("Getting the Verification ID here !!!\n$verificationId");

        // Sign the user in (or link) with the credential
        await auth.signInWithCredential(credential);
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        // Auto-resolution timed out...
      },
    );
  } catch (e) {
    print("Getting the Error here! \n$e");

   }



}

void verifyingTheOTP(String verificationCode) async {
  FirebaseAuth auth = FirebaseAuth.instance;

  try {
    await auth.verifyPhoneNumber(
      codeSent: (String verificationId, int resendToken) async {
        // Update the UI - wait for the user to enter the SMS code
        String smsCode = verificationCode;

        print("Executing the codeSent Function");

        // Create a PhoneAuthCredential with the code
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
            verificationId: verificationId, smsCode: smsCode);

        print("Getting the Verification ID here !!!\n$verificationId");

        // Sign the user in (or link) with the credential
        await auth.signInWithCredential(credential);
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        // Auto-resolution timed out...
      },
    );
  } catch (e) {
    print("Getting the Error here! \n$e");

  }



}

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:my_resume/repository/firebase/phone_auth.dart';

class AuthStore {
  PhoneAuthVerification phoneAuthVerification;

  // constructor:---------------------------------------------------------------
  AuthStore(PhoneAuthVerification phoneAuthVerification)
      : this.phoneAuthVerification = phoneAuthVerification;

  @observable
  String userGoogleID;

  @observable
  String userPhoneID;

  @action
  Future<void> sendOtp(String phoneNumber) async {
    await phoneAuthVerification.sendingTheOtp(phoneNumber).then((value) {
      print("Executing the sendOtp function successfully!");
    }).catchError((onError) {
      print("Getting the error in sendOtp function auth_store");
      throw onError;
    });
  }
}

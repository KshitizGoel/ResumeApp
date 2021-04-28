import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:my_resume/repository/firebase/auth_repo.dart';
import 'package:my_resume/services/auth_services/phone_auth.dart';

class AuthStore {

  //For now changing the AuthRepository to PhoneAuth

  PhoneAuth phoneAuthVerification;

  // constructor:---------------------------------------------------------------
  AuthStore(PhoneAuth phoneAuthVerification)
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

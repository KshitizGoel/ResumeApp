import 'package:flutter/cupertino.dart';
import 'package:my_resume/services/auth_services/facebook_auth.dart';
import 'package:my_resume/services/auth_services/google_auth.dart';
import 'package:my_resume/services/auth_services/phone_auth.dart';

class AuthRepository {
  final PhoneAuth phoneAuth;
  final GoogleAuth googleAuth;
  final FacebookAuth facebookAuth;

  AuthRepository(this.phoneAuth, this.googleAuth, this.facebookAuth);

  Future<String> sendTheOTP(String phoneNumber) async {
    return phoneAuth.sendingTheOtp(phoneNumber).then((value) {
      print("Executing the function sendTheOTP in Auth Repository!!!! ");

      return value;
    }).catchError((onError) {
      print("Getting the error in Auth Repository!!!! sendTheOTP");
      throw onError;
    });
  }

  Future<void> verifyingTheOtp(
      String verificationCode ) async {
    return phoneAuth.verifyingTheOTP(verificationCode ).then((value) {
      print("Executing the function verifyTheOTP in Auth Repository!!!! ");

      return value;
    }).catchError((onError) {
      print("Getting the error in Auth Repository!!!!! verifyingTheOtp");
      throw onError;
    });
  }

  Future <void> googleSignIn() async{
    return googleAuth.handleGoogleSignIn().then((value){
      return value;
    }).catchError((onError){
      print("Getting the error in auth_repo !!!!! googleSignIn");
      throw onError;
    });
  }

  Future<String> googleLogOut(BuildContext context) async {
    return googleAuth.loggingOutTheUser(context).then((value) {
      return value.toString();
    }).catchError((onError) {
      print("Getting the error in Auth Repository!!!!! googleLogOut");
      throw onError;
    });
  }

  Future<String> facebookSignIn() async {
    return facebookAuth.facebookSignIn().then((value) {
      return value;
    }).catchError((onError) {
      print("Getting the error in Auth Repository!!!!! facebookSignIn");
      return onError.toString();
    });
  }
}

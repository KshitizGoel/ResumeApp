import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:my_resume/repository/firebase/auth_repo.dart';
part 'auth_store.g.dart';

class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store {
  AuthRepository authRepository;
  // constructor:---------------------------------------------------------------
  _AuthStore(AuthRepository authRepository)
      : this.authRepository = authRepository;

  @observable
  String userGoogleID;

  @observable
  String userPhoneID;

  @observable
  String facebookID;


  @action
  Future<String> sendOtp(String phoneNumber) async {
    return authRepository.sendTheOTP(phoneNumber).then((value) {
      print("Executing the sendOtp function successfully!");
    }).catchError((onError) {
      print("Getting the error in sendOtp function auth_store");
      throw onError;
    });
  }

  @action
  Future<void> verifyTheOtp(String verificationCode , BuildContext context) async{
    return authRepository.verifyingTheOtp(verificationCode, context).then((value) {
      return value;
    }).catchError((onError){
      print("Getting the error in sendOtp function auth_store");
      throw onError;
    });
  }

  @action
  Future <String> facebookLogin() async{
    return authRepository.facebookSignIn().then((value) {
      print("Executing the facebook login ");
      return value;
    }).catchError((onError){
      print("Getting the error in Store level Facebook login!!!!");
      throw onError;
    });
  }

}

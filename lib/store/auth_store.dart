import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:my_resume/repository/firebase/auth_repo.dart';
part 'auth_store.g.dart';
@Injectable()
class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store {
  AuthRepository authRepository;
  // constructor:---------------------------------------------------------------
  _AuthStore(AuthRepository authRepository)
      : this.authRepository = authRepository;

  @observable
  late String userGoogleID;

  @observable
  late String userPhoneID;

  @observable
  late String facebookID;


  @action
  Future<Null> sendOtp(String phoneNumber) async {
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
  Future <void> googleSignIn() async{
    return authRepository.googleSignIn().then((value) {
      return value;
    }).catchError((onError){
      print("Getting the error in auth_store googleSignIn");
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

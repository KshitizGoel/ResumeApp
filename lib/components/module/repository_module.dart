import 'package:injectable/injectable.dart';
import 'package:my_resume/repository/firebase/auth_repo.dart';
import 'package:my_resume/services/auth_services/facebook_auth.dart';
import 'package:my_resume/services/auth_services/google_auth.dart';
import 'package:my_resume/services/auth_services/phone_auth.dart';

@module
abstract class RepositoryModule {
  @factoryMethod
  AuthRepository authRepository(
      PhoneAuth phoneAuth, GoogleAuth googleAuth, FacebookAuth facebookAuth) {
    return AuthRepository(phoneAuth, googleAuth, facebookAuth);
  }
}

import 'package:inject/inject.dart';
import 'package:my_resume/repository/firebase/auth_repo.dart';
import 'package:my_resume/services/auth_services/facebook_auth.dart';
import 'package:my_resume/services/auth_services/google_auth.dart';
import 'package:my_resume/services/auth_services/phone_auth.dart';

@module
class RepositoryModule {
  @provide
  @singleton
  AuthRepository authRepository(PhoneAuth phoneAuth, GoogleAuth googleAuth , FacebookAuth facebookAuth) =>
      AuthRepository(phoneAuth, googleAuth , facebookAuth);
}

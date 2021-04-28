import 'package:inject/inject.dart';
import 'package:my_resume/main.dart';
import 'package:my_resume/repository/firebase/auth_repo.dart';
import 'package:my_resume/services/auth_services/phone_auth.dart';


abstract class AppComponent {



  @provide
  MyApp get app;
  @provide
  PhoneAuth getPhoneAuthVerification();
}

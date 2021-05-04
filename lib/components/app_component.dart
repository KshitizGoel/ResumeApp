import 'package:inject/inject.dart';
import 'package:my_resume/main.dart';
import 'package:my_resume/repository/firebase/auth_repo.dart';

import 'module/repository_module.dart';

@Injector(const [RepositoryModule])
abstract class AppComponent {
  @provide
  MyApp get app;


  @provide
  AuthRepository getAuthRepository();
}

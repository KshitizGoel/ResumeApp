import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:my_resume/components/app_component.dart';
import 'package:my_resume/repository/firebase/auth_repo.dart';
import 'package:my_resume/screens/authentication/authentication.dart';
import 'package:my_resume/store/auth_store.dart';
import 'package:provider/provider.dart';

import 'components/injection.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await setPreferredOrientations();
  await configureInjection();
  return runZonedGuarded(() async {
    runApp(MyApp());
  }, (error, stack) {
    print(stack);
    print(error);
  });
}

Future<void> setPreferredOrientations() {
  return SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,

  ]);
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  // Create your store as a final variable in a base Widget. This works better
  // with Hot Reload than creating it directly in the `build` function.

  final AuthStore authStore = AuthStore(getIt<AuthRepository>());

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthStore>(create: (_) => authStore),

      ],
      child: Observer(
        name: 'global-observer',
        builder: (context) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,

              // home: _userStore.isLoggedIn ? HomeScreen() : LoginScreen(),
              home: Authentication()
          );
        },
      ),
    );
  }
}
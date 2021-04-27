import 'package:firebase_core/firebase_core.dart';
 import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
 import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:my_resume/repository/firebase/phone_auth.dart';
import 'package:my_resume/screens/authentication/authentication.dart';
 import 'package:my_resume/store/auth_store.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    final PhoneAuthVerification phoneAuthVerification = PhoneAuthVerification();
    final AuthStore authStore = AuthStore();

    return MultiProvider(
      providers: [
        Provider<PhoneAuthVerification>(create: (_) => phoneAuthVerification),
        Provider<AuthStore>(create: (_) => authStore),
      ],
      child: Observer(
        builder: (context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Authentication(),
          );
        },
      ),
    );
  }
}

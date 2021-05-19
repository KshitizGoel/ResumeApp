import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:my_resume/components/injection.config.dart';
import 'dart:async';

final getIt = GetIt.instance;

@injectableInit
Future<void> configureInjection() => $initGetIt(getIt);

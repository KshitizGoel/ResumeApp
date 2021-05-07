// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../repository/firebase/auth_repo.dart' as _i3;
import '../services/auth_services/facebook_auth.dart' as _i6;
import '../services/auth_services/google_auth.dart' as _i5;
import '../services/auth_services/phone_auth.dart' as _i4;
import '../store/auth_store.dart' as _i7;
import 'module/repository_module.dart'
    as _i8; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future <_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final repositoryModule = _$RepositoryModule();
  gh.factory<_i3.AuthRepository>(() => repositoryModule.authRepository(
      get<_i4.PhoneAuth>(), get<_i5.GoogleAuth>(), get<_i6.FacebookAuth>()));
  gh.factory<_i7.AuthStore>(() => _i7.AuthStore(get<_i3.AuthRepository>()));
  gh.singleton<_i6.FacebookAuth>(_i6.FacebookAuth());
  gh.singleton<_i5.GoogleAuth>(_i5.GoogleAuth());
  gh.singleton<_i4.PhoneAuth>(_i4.PhoneAuth());
   return    get;
}

class _$RepositoryModule extends _i8.RepositoryModule {}

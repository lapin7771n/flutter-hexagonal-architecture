// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'adapter/auth/out/auth_adapter.dart' as _i3;
import 'application/auth/port/in/load_user_use_case.dart' as _i5;
import 'application/auth/port/in/login_use_case.dart' as _i7;
import 'application/auth/port/in/logout_use_case.dart' as _i9;
import 'application/auth/port/out/load_user_port.dart' as _i4;
import 'application/auth/port/out/login_port.dart' as _i6;
import 'application/auth/port/out/logout_port.dart' as _i8;
import 'application/auth/service/auth_service.dart' as _i10;
import 'di/auth_module.dart' as _i11; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final authModule = _$AuthModule();
  gh.singleton<_i3.AuthAdapter>(_i3.AuthAdapter());
  gh.factory<_i4.LoadUserPort>(() => authModule.loadUserPort);
  gh.factory<_i5.LoadUserUseCase>(() => authModule.loadUserUseCase);
  gh.factory<_i6.LoginPort>(() => authModule.loginPort);
  gh.factory<_i7.LoginUseCase>(() => authModule.loginUseCase);
  gh.factory<_i8.LogoutPort>(() => authModule.logoutPort);
  gh.factory<_i9.LogoutUseCase>(() => authModule.logoutUseCase);
  gh.singleton<_i10.AuthService>(_i10.AuthService(
      get<_i6.LoginPort>(), get<_i8.LogoutPort>(), get<_i4.LoadUserPort>()));
  return get;
}

class _$AuthModule extends _i11.AuthModule {}

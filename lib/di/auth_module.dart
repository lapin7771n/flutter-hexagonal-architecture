import 'package:flutter_hexagonal/adapter/auth/out/auth_adapter.dart';
import 'package:flutter_hexagonal/application/auth/port/in/load_user_use_case.dart';
import 'package:flutter_hexagonal/application/auth/port/in/login_use_case.dart';
import 'package:flutter_hexagonal/application/auth/port/in/logout_use_case.dart';
import 'package:flutter_hexagonal/application/auth/port/out/load_user_port.dart';
import 'package:flutter_hexagonal/application/auth/port/out/login_port.dart';
import 'package:flutter_hexagonal/application/auth/port/out/logout_port.dart';
import 'package:flutter_hexagonal/application/auth/service/auth_service.dart';
import 'package:flutter_hexagonal/main.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AuthModule {
  LoadUserUseCase get loadUserUseCase => injector.get<AuthService>();
  LoginUseCase get loginUseCase => injector.get<AuthService>();
  LogoutUseCase get logoutUseCase => injector.get<AuthService>();

  LoadUserPort get loadUserPort => injector.get<AuthAdapter>();
  LoginPort get loginPort => injector.get<AuthAdapter>();
  LogoutPort get logoutPort => injector.get<AuthAdapter>();
}

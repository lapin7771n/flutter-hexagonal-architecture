import 'package:flutter_hexagonal/application/auth/port/in/load_user_use_case.dart';
import 'package:flutter_hexagonal/application/auth/port/in/login_use_case.dart';
import 'package:flutter_hexagonal/application/auth/port/in/logout_use_case.dart';
import 'package:flutter_hexagonal/application/auth/port/out/load_user_port.dart';
import 'package:flutter_hexagonal/application/auth/port/out/login_port.dart';
import 'package:flutter_hexagonal/application/auth/port/out/logout_port.dart';
import 'package:flutter_hexagonal/domain/auth/user.dart';
import 'package:injectable/injectable.dart';

@singleton
class AuthService with LoadUserUseCase, LoginUseCase, LogoutUseCase {
  const AuthService(this.loginPort, this.logoutPort, this.loadUserPort);

  final LoginPort loginPort;
  final LogoutPort logoutPort;
  final LoadUserPort loadUserPort;

  @override
  Stream<User?> loadUser() {
    return loadUserPort.loadUser();
  }

  @override
  Future<User> login(String email, String password) {
    return loginPort.login(email, password);
  }

  @override
  Future logout() {
    return logoutPort.logout();
  }
}

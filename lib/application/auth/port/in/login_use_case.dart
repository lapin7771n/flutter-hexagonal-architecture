import 'package:flutter_hexagonal/application/auth/port/in/login_command.dart';
import 'package:flutter_hexagonal/domain/auth/user.dart';

abstract class LoginUseCase {
  Future<User> login(LoginCommand loginCommand);
}

import 'package:flutter_hexagonal/domain/auth/user.dart';

abstract class LoginUseCase {
  Future<User> login(String email, String password);
}

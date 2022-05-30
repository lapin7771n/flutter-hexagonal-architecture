import 'package:flutter_hexagonal/domain/auth/user.dart';

abstract class LoginPort {
  Future<User> login(String email, String password);
}

class UserNotFound with Exception {}

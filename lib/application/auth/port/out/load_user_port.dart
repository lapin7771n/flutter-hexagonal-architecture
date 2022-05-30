import 'package:flutter_hexagonal/domain/auth/user.dart';

abstract class LoadUserPort {
  Stream<User?> loadUser();
}

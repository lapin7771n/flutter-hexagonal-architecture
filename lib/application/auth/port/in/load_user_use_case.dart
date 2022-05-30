import 'package:flutter_hexagonal/domain/auth/user.dart';

abstract class LoadUserUseCase {
  Stream<User?> loadUser();
}

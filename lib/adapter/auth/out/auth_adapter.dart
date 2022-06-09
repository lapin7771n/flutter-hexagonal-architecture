import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_hexagonal/application/auth/port/out/load_user_port.dart';
import 'package:flutter_hexagonal/application/auth/port/out/login_port.dart';
import 'package:flutter_hexagonal/application/auth/port/out/logout_port.dart';
import 'package:flutter_hexagonal/domain/auth/user.dart' as user;
import 'package:injectable/injectable.dart';

@singleton
class AuthAdapter with LoginPort, LogoutPort, LoadUserPort {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  Future<user.User> login(String email, String password) async {
    final userCredentials = await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    if (userCredentials.user == null) {
      throw UserNotFound();
    }

    final firebaseUser = userCredentials.user!;

    return user.User(firebaseUser.email!);
  }

  @override
  Future logout() => FirebaseAuth.instance.signOut();

  @override
  Stream<user.User?> loadUser() {
    return firebaseAuth.userChanges().map((currentUser) {
      return currentUser == null ? null : user.User(currentUser.email!);
    });
  }
}

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hexagonal/adapter/auth/in/ui/authentication_page.dart';
import 'package:flutter_hexagonal/firebase_options.dart';
import 'package:flutter_hexagonal/main.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  configureDependencies();
  runApp(const AuthenticationPage());
}

final injector = GetIt.instance;

@InjectableInit()
void configureDependencies() => $initGetIt(injector);

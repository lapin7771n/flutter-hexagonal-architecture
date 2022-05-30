import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hexagonal/adapter/auth/in/bloc/auth_bloc.dart';
import 'package:flutter_hexagonal/adapter/auth/in/ui/loading_page.dart';
import 'package:flutter_hexagonal/adapter/auth/in/ui/login_page.dart';
import 'package:flutter_hexagonal/adapter/auth/in/ui/user_info_page.dart';
import 'package:flutter_hexagonal/application/auth/port/in/load_user_use_case.dart';
import 'package:flutter_hexagonal/application/auth/port/in/login_use_case.dart';
import 'package:flutter_hexagonal/application/auth/port/in/logout_use_case.dart';
import 'package:flutter_hexagonal/main.dart';

class AuthenticationPage extends StatelessWidget {
  const AuthenticationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(
        injector.get<LoginUseCase>(),
        injector.get<LogoutUseCase>(),
        injector.get<LoadUserUseCase>(),
      ),
      child: MaterialApp(
        home: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            return Navigator(
              pages: [
                if (state is UnauthState)
                  const MaterialPage(child: LoginPage()),
                if (state is AuthLoggedInState)
                  const MaterialPage(child: UserInfoPage()),
                if (state is AuthInitial)
                  const MaterialPage(child: LoadingPage()),
              ],
              onPopPage: (route, result) => route.didPop(result),
            );
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hexagonal/adapter/auth/in/bloc/auth_bloc.dart';
import 'package:flutter_hexagonal/application/auth/port/in/login_command.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            autocorrect: false,
            validator: (email) {
              if (email != null && email.isValidEmail) {
                return null;
              }

              return 'Email is invalid';
            },
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            controller: passwordController,
            obscureText: true,
            validator: (password) {
              if (password != null && password.isValidPassword) {
                return null;
              }

              return 'Password should be 8 characters at least';
            },
          ),
          ElevatedButton(
            onPressed: onLoginButtonPressed,
            child: const Text('Login'),
          ),
        ],
      ),
    );
  }

  void onLoginButtonPressed() {
    final isValid = formKey.currentState!.validate();

    if (isValid) {
      context
          .read<AuthBloc>()
          .add(LoginAuthEvent(emailController.text, passwordController.text));
    }
  }
}

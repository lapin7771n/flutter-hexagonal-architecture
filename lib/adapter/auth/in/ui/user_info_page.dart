import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hexagonal/adapter/auth/in/bloc/auth_bloc.dart';
import 'package:flutter_hexagonal/domain/auth/user.dart';

class UserInfoPage extends StatelessWidget {
  const UserInfoPage({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile page')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Email: ${user.email}'),
            ElevatedButton(
              onPressed: () => context.read<AuthBloc>().add(LogoutAuthEvent()),
              child: const Text('Log out'),
            )
          ],
        ),
      ),
    );
  }
}

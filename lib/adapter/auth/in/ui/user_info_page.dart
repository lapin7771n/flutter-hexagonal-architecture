import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';

class UserInfoPage extends StatelessWidget {
  const UserInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ProfileScreen(
      providerConfigs: [EmailProviderConfiguration()],
    );
  }
}

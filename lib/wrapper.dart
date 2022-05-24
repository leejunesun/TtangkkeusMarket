import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ttangkkeusmarket/src/cloud_functions/auth_service.dart';
import 'package:ttangkkeusmarket/src/screens/login_screen.dart';
import 'package:ttangkkeusmarket/src/screens/mypage_screen.dart';

import 'src/models/user.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return StreamBuilder<User?>(
        stream: authService.user,
        builder: (_, AsyncSnapshot<User?> snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final User? user = snapshot.data;
            return user == null ? MypageScreen() : LoginScreen();
          } else {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}

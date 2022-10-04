import 'package:flutter/material.dart';
import 'package:ttangkkeusmarket/src/widgets/base_appbar.dart';
import 'package:ttangkkeusmarket/src/screens/screen_splash.dart';
import './screen_login.dart';

class MypageScreen extends StatelessWidget {
  const MypageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: BaseAppBar(appBar: AppBar(), title: "마이페이지", center: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 340,
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(_loginRoute());
                },
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFFF6C544),
                  elevation: 0.0,
                  shadowColor: Colors.transparent,
                ),
                child: const Text(
                  "로그인/회원가입",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'NotoSans',
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Route _loginRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => LoginScreens(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

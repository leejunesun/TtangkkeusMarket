import 'dart:async';
import 'package:ttangkkeusmarket/src/widgets/base_appbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ttangkkeusmarket/src/screens/screen_login.dart';
import '../models/model_cart.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() {
    return _SplashScreenState();
  }
}

class _SplashScreenState extends State<SplashScreen> {
  Future<bool> checkLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    bool isLogin = prefs.getBool('isLogin') ?? false;
    String uid = prefs.getString('uid') ?? '';
    cartProvider.fetchCartItemsOrCreate(uid);
    return isLogin;
  }

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

  void moveScreen() async {
    await checkLogin().then((isLogin) {
      if (isLogin) {
        Navigator.of(context).pushReplacementNamed('/profile');
      }
    });
  }

  @override
  void initState() {
    super.initState();
    Timer(Duration(milliseconds: 0), () {
      moveScreen();
    });
  }

  Route _loginRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => LoginScreens(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}

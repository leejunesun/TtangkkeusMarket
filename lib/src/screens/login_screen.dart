import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import 'package:ttangkkeusmarket/src/widgets/timesbutton_appbar.dart';

import '../cloud_functions/auth_service.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({
    Key? Key,
  }) : super(key: Key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    final authService = Provider.of<AuthService>(context);

    final currentWdith = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: TimesAppBar(
        appBar: AppBar(),
        title: "로그인",
        center: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // const SizedBox(
          //   height: 10.0,
          // ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            child: TextField(
              controller: emailController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color(0xFFA2A7B9),
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(
                    5.0,
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 1.0,
                  ),
                ),
                hintText: "아이디를 입력해주세요.",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
            child: TextField(
              controller: passwordController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color(0xFFA2A7B9),
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(
                    5.0,
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 1.0,
                  ),
                ),
                hintText: "비밀번호를 입력해주세요.",
              ),
            ),
          ),
          // const SizedBox(
          //   height: 25.0,
          // ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 25.0, 20.0, 0.0),
            child: SizedBox(
              width: currentWdith - 15,
              height: 40.0,
              child: ElevatedButton(
                onPressed: () {
                  authService.signInWithEmailAndPassword(
                    emailController.text,
                    passwordController.text,
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: const Color(
                    0xFFF6C544,
                  ),
                  elevation: 0.0,
                  shadowColor: Colors.transparent,
                ),
                child: const Text(
                  '로그인',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'SF',
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          Wrap(
            children: [
              TextButton(
                onPressed: () {
                  // forgot id screen
                },
                style: TextButton.styleFrom(
                  primary: Colors.transparent,
                ),
                child: const Text(
                  '아이디 찾기',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'SF',
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  // forgot password screen
                },
                style: TextButton.styleFrom(
                  primary: Colors.transparent,
                ),
                child: const Text(
                  '비밀번호 찾기',
                  style: TextStyle(
                    color: Color(
                      0xFF000000,
                    ),
                    fontFamily: 'SF',
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          // const SizedBox(
          //   height: 40.0,
          // ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 35.0, 20.0, 0.0),
            child: SizedBox(
              width: currentWdith - 15,
              height: 40.0,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/register');
                },
                style: ElevatedButton.styleFrom(
                  side: const BorderSide(
                    color: Color(
                      0xFFF6C544,
                    ),
                    width: 1.0,
                  ),
                  primary: Colors.transparent,
                  elevation: 0.0,
                  shadowColor: Colors.transparent,
                ),
                child: const Text(
                  '회원가입',
                  style: TextStyle(
                    color: Color(
                      0xFFF6C544,
                    ),
                    fontFamily: 'SF',
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

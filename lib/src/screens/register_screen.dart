import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:ttangkkeusmarket/src/cloud_functions/auth_control.dart';

import 'package:ttangkkeusmarket/src/screens/home_screen.dart';
import 'package:ttangkkeusmarket/src/widgets/custom_button.dart';
import 'package:ttangkkeusmarket/src/screens/login_screen.dart';
import 'package:ttangkkeusmarket/src/screens/mypage_screen.dart';


import 'package:ttangkkeusmarket/src/models/user.dart';

import '../widgets/components/reusable_primary_button.dart';
import '../widgets/components/reusable_textfield.dart';

import '../widgets/angleleft_appbar.dart';

import 'package:provider/provider.dart';
import 'package:get/get.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ttangkkeusmarket/Phone/auth_phone.dart';



import 'package:ttangkkeusmarket/src/cloud_functions/auth_service.dart';
import 'package:ttangkkeusmarket/src/cloud_functions/Authstatus.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/cupertino.dart';
import 'package:remedi_kopo/remedi_kopo.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _auth = FirebaseAuth.instance;
  final TextEditingController confirmpasswordController =
      TextEditingController();
  final TextEditingController useridController = TextEditingController();
  final TextEditingController NameEditingController = TextEditingController();
  String? errorMessage;
  String addressJSON = '';
  @override
  Widget build(BuildContext context) {
    AuthController authController = AuthController();
    final currentWidth = MediaQuery.of(context).size.width;
    final currentHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AngleLeftAppBar(
        appBar: AppBar(),
        title: "회원가입",
        center: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  ),
                  Text(
                    '아이디',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'SF',
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    '*',
                    style: TextStyle(
                        color: Color(0xFFED752E),
                        fontFamily: 'SF',
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  // const Padding(
                  //   padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                  // ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    width: currentWidth / 1.65,
                    // width: 235.0,
                    // height: 40.0,
                    child: ReusableTextField(
                      key: ValueKey(3),
                      validator: (value) {
                        if(value!.isEmpty || value.length < 6) {
                          return 'Please enter at least 6 charters';
                        }
                        return null;
                      },
                      controller: useridController,
                      hintText: "예: ttangkkeus12",
                      // helperText: "6자 이상의 영문 혹은 영문과 숫자를 조합",
                      // hintMaxLines: 1,
                      // helperMaxLines: 1,
                    ),
                  ),
                  const Padding(padding: EdgeInsets.fromLTRB(10, 10, 0, 0)),
                  Container(
                    width: currentWidth / 3.8,
                    // height: 50.0,
                    // child: Expanded(
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                          color: Color(0xFFF6C544),
                          width: 1.0,
                        ),
                        primary: Colors.transparent,
                        elevation: 0.0,
                        shadowColor: Colors.transparent,
                        minimumSize: Size(
                          currentWidth / 1.9,
                          currentHeight / 17.5,
                        ),
                      ),
                      child: const Text(
                        '중복확인',
                        style: TextStyle(
                          color: Color(0xFFF6C544),
                          fontFamily: 'SF',
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 50.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  ),
                  Text(
                    '비밀번호',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'SF',
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    '*',
                    style: TextStyle(
                        color: Color(0xFFED752E),
                        fontFamily: 'SF',
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              const SizedBox(height: 5.0),
              // const Padding(padding: EdgeInsets.only(right: 20)),
              Container(
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                width: currentWidth,
                // height: 35.0,
                child: ReusableTextField(
                  key: ValueKey(4),
                  controller: authController.passwordController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the password';
                    }
                    return null;
                  },
                  hintText: "비밀번호를 입력해주세요.",
                ),
              ),
              const SizedBox(height: 25.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  ),
                  Text(
                    '비밀번호 확인',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'SF',
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    '*',
                    style: TextStyle(
                        color: Color(0xFFED752E),
                        fontFamily: 'SF',
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              const SizedBox(height: 5.0),
              Container(
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                width: currentWidth,
                // height: 35.0,
                child: ReusableTextField(
                  key: ValueKey(5),
                  controller: confirmpasswordController,
                  validator: (value) {
                    if (authController.passwordController !=
                        authController.confirmpasswordController) {
                      return "password don't match";
                    }
                    return null;
                  },
                  hintText: "비밀번호를 한번 더 입력해주세요.",
                ),
              ),

              const SizedBox(height: 50.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  ),
                  Text(
                    '이름',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'SF',
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    '*',
                    style: TextStyle(
                        color: Color(0xFFED752E),
                        fontFamily: 'SF',
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              const SizedBox(height: 5.0),
              Container(
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                width: currentWidth,
                // height: 35.0,
                child: ReusableTextField(
                  key: ValueKey(6),
                  controller: NameEditingController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return ("Name cannot be Empty");
                    }
                    return null;
                  },
                  hintText: "예: 김땅끗",
                ),
              ),

              const SizedBox(height: 25.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  ),
                  Text(
                    '이메일',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'SF',
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    '*',
                    style: TextStyle(
                        color: Color(0xFFED752E),
                        fontFamily: 'SF',
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              const SizedBox(height: 5.0),
              Container(
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                width: currentWidth,
                // height: 35.0,
                child: ReusableTextField(
                  key: ValueKey(7),
                  controller: authController.emailController,
                  validator: (value) {
                  if(value!.isEmpty || !value.contains('@') ){
                    return 'Please enter a valid email address.';
                  }
                  return null;
                  },
                  hintText: "예: ttangkkeus12@ttangkeus.com",
                ),
              ),
              const SizedBox(height: 50.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  ),
                  Text(
                    '휴대폰',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'SF',
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    '*',
                    style: TextStyle(
                        color: Color(0xFFED752E),
                        fontFamily: 'SF',
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                  ),
                  SizedBox(
                    width: currentWidth / 1.9,
                    // height: 35.0,
                    child: ReusableTextField(
                      key: ValueKey(8),
                      hintText: "'-'없이 숫자만",
                      // helperText: "6자 이상의 영문 혹은 영문과 숫자를 조합",
                      // hintMaxLines: 1,
                      // helperMaxLines: 1,
                    ),
                  ),
                  const Padding(padding: EdgeInsets.fromLTRB(10, 10, 0, 0)),
                  SizedBox(
                    width: currentWidth / 2.9,
                    // width: 140.0,
                    // height: 35.0,
                    // child: Expanded(
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                          color: Color(0xFFF6C544),
                          width: 1.0,
                        ),
                        primary: Colors.transparent,
                        elevation: 0.0,
                        shadowColor: Colors.transparent,
                        minimumSize: Size(
                          currentWidth / 1.9,
                          currentHeight / 17.5,
                        ),
                      ),
                      child: const Text(
                        '인증번호 받기',
                        style: TextStyle(
                          color: Color(0xFFF6C544),
                          fontFamily: 'SF',
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                  ),
                  Container(
                    width: currentWidth / 1.9,
                    // height: 35.0,
                    child: ReusableTextField(
                      key: ValueKey(9),
                      // hintText: "'-'없이 숫자만",
                        // helperText: "6자 이상의 영문 혹은 영문과 숫자를 조합",
                        ),
                  ),
                  const Padding(padding: EdgeInsets.fromLTRB(10, 10, 0, 0)),
                  Container(
                    width: currentWidth / 2.9,
                    // height: 35.0,
                    // child: Expanded(
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                          color: Color(0xFFF6C544),
                          width: 1.0,
                        ),
                        primary: Colors.transparent,
                        elevation: 0.0,
                        shadowColor: Colors.transparent,
                        minimumSize: Size(
                          currentWidth / 1.9,
                          currentHeight / 17.5,
                        ),
                      ),
                      child: const Text(
                        '인증번호 확인',
                        style: TextStyle(
                          color: Color(0xFFF6C544),
                          fontFamily: 'SF',
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  )
                ],
              ),

              const SizedBox(height: 40.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  ),
                  Text(
                    '주소',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'SF',
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    '*',
                    style: TextStyle(
                        color: Color(0xFFED752E),
                        fontFamily: 'SF',
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              const SizedBox(height: 5.0),
              Container(
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                width: currentWidth,
                // height: 35.0,
                child: ReusableTextField(

                  onTap: () async {
                    KopoModel model = await Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => RemediKopo(),
                      ),
                    );
                    print(model.toJson());
                    setState(() {
                      addressJSON =
                          '${model.address} ${model.buildingName}${model.apartment == 'Y' ? '아파트' : ''}${model.zonecode}';
                    });
                  },
                  hintText: '도로명, 지번, 건물명 검색',
                  suffixIcon: LineIcon(Icons.search),
                ),
              ),
              Text('$addressJSON'), // textfiled 안에 넣어야하는데 에러뜸
              const SizedBox(height: 140.0),
              ReusablePrimaryButton(
                buttonText: '가입하기',
                onTap: () {
                  authController.createAcoount();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

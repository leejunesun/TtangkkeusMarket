import 'package:flutter/material.dart';
import 'package:ttangkkeusmarket/widgets/AppBar.dart';

class MypageScreen extends StatelessWidget {
  const MypageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BaseAppBar(appBar: AppBar(), title: "마이페이지", center: true),
        body: Center(
            child: Text(
          "Mypage Screen",
          style: TextStyle(fontSize: 30),
        )));
  }
}

import 'package:flutter/material.dart';
import 'package:ttangkkeusmarket/widgets/AppBar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BaseAppBar(appBar: AppBar(), title: "땅끗마켓", center: true),
        body: Center(
            child: Text(
          "Home Screen",
          style: TextStyle(fontSize: 30),
        )));
  }
}

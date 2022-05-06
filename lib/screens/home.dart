import 'package:flutter/material.dart';
import 'package:ttangkkeusmarket/widgets/AppBar.dart';
import 'package:ttangkkeusmarket/widgets/CarouselList.dart';
import 'package:ttangkkeusmarket/widgets/TabBar.dart';
import 'package:ttangkkeusmarket/widgets/BottomNavBar.dart';
// import 'package:ttangkkeusmarket/widgets/HorizontalList.dart';

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Color(0xF6C544)),
      home: MyBottomNavBar(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(appBar: AppBar(), title: "땅끗마켓", center: true),
      body: MainTabBar()
    );
  }
}

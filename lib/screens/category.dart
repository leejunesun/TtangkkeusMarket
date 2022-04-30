import 'package:flutter/material.dart';
import 'package:ttangkkeusmarket/widgets/AppBar.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BaseAppBar(appBar: AppBar(), title: "카테고리", center: true),
        body: Center(
            child: Text(
          "Category Screen",
          style: TextStyle(fontSize: 30),
        )));
  }
}

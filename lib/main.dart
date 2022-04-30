import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ttangkkeusmarket/widgets/bottom_navbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Color(0xF6C544)),
      home: MyBottomNavBar(),
    );
  }
}




// class Appbar extends StatelessWidget {
//   const Appbar({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: BaseAppBar(),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ttangkkeusmarket/src/home.dart';
import 'package:ttangkkeusmarket/src/providers/bottom_nav_provider.dart';
import 'package:ttangkkeusmarket/src/root_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFFF6C544),
      ),
      home: MultiProvider(providers: [
        ChangeNotifierProvider(
            create: (BuildContext context) => BottomNavigationProvier()),
      ], 
      child: Home()),
    );
  }
}

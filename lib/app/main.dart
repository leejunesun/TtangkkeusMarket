import 'package:flutter/material.dart';
import 'package:ttangkkeusmarket/app/src/screens/item_detail/item_detail.dart';

import 'package:ttangkkeusmarket/app/src/screens/cart/cart_screen.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';

import 'package:firebase_core/firebase_core.dart';

import 'package:ttangkkeusmarket/app/src/models/auth_model.dart';
import 'package:ttangkkeusmarket/app/src/navbar.dart';
import 'package:ttangkkeusmarket/app/src/providers/bottom_nav_provider.dart';
import 'package:ttangkkeusmarket/app/src/screens/login/screen_login.dart';
import 'package:ttangkkeusmarket/app/src/screens/register/screen_regist.dart';
import 'package:ttangkkeusmarket/app/src/models/item_provider_model.dart';
import 'package:ttangkkeusmarket/app/src/models/query_model.dart';
import 'package:ttangkkeusmarket/app/src/screens/search/search_screen.dart';
import 'package:ttangkkeusmarket/app/src/screens/cart/model/cart_model.dart';
import 'package:ttangkkeusmarket/app/src/screens/profile/screen_profile.dart';
import 'package:ttangkkeusmarket/app/src/screens/home/home_screen.dart';
import 'package:ttangkkeusmarket/app/src/screens/my_page/mypage_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //추가
  // await FlutterConfig.loadEnvVariables();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  try {} catch (e) {
    print('Init failed' + e.toString());
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => FirebaseAuthProvider()),
          ChangeNotifierProvider(create: (_) => ItemProvider()),
          ChangeNotifierProvider(create: (_) => QueryProvider()),
          ChangeNotifierProvider(create: (_) => CartProvider()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: const Color(0xFFF6C544),
          ),
          initialRoute: '/',
          routes: {
            //'/': (context) => CustomNavBar(),
            '/login': (BuildContext context) => LoginScreens(),
            '/register': (BuildContext context) => RegisterScreens(),
            '/detail': (BuildContext context) => DetailScreen(),
            '/search': (BuildContext context) => SearchScreen(),
            '/profile': (BuildContext context) => TabProfile(),
            '/home': (BuildContext context) => HomeScreen(),
            '/mypage': (BuildContext context) => MypageScreen(),
            '/cart': (BuildContext context) => CartScreen(),

            // '/': (context) => CustomNavBar(),
            // '/register': (context) => RegisterScreen(),
          },
          home: MultiProvider(
            providers: [
              ChangeNotifierProvider(
                  create: (BuildContext context) => BottomNavigationProvier()),
            ],
            child: const CustomNavBar(),
          ),
        ));
  }
}

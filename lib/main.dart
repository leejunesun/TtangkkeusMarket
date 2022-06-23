import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'package:ttangkkeusmarket/src/cloud_functions/auth_service.dart';
import 'package:ttangkkeusmarket/src/navbar.dart';
import 'package:ttangkkeusmarket/src/providers/bottom_nav_provider.dart';
import 'package:ttangkkeusmarket/src/screens/register_screen.dart';

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
          Provider<AuthService>(
            create: (_) => AuthService(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: const Color(0xFFF6C544),
          ),
          initialRoute: '/',
          routes: {
            // '/': (context) => CustomNavBar(),
            '/register': (context) => RegisterScreen(),
          },
          home: MultiProvider(
            providers: [
              ChangeNotifierProvider(
                  create: (BuildContext context) => BottomNavigationProvier()),
            ],
            child: CustomNavBar(),
          ),
        ));
  }
}

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:line_icons/line_icons.dart';

import 'package:ttangkkeusmarket/src/providers/bottom_nav_provider.dart';
import 'package:ttangkkeusmarket/src/screens/home_screen.dart';
import 'package:ttangkkeusmarket/src/screens/category_screen.dart';
import 'package:ttangkkeusmarket/src/screens/map_screen.dart';
import 'package:ttangkkeusmarket/src/screens/search_screen.dart';
import 'package:ttangkkeusmarket/src/screens/mypage_screen.dart';
import 'package:ttangkkeusmarket/src/screens/tab_home.dart';
import 'package:ttangkkeusmarket/src/screens/screen_profile.dart';
import 'package:ttangkkeusmarket/src/screens/cart_screen.dart';
import 'package:ttangkkeusmarket/src/screens/screen_splash.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BottomNavigationProvier bottomNavigationBar =
        Provider.of<BottomNavigationProvier>(context);

    Widget _navigationBody() {
      switch (bottomNavigationBar.currentPage) {
        case 0:
          return const HomeScreen();
        case 1:
          return CategoryScreen();
        case 2:
          return const MapScreen();
        case 3:
          return const SearchScreen();
        case 4:
          return SplashScreen();
        case 5:
          return TabHome();
        case 6:
          return CartScreen();
        case 7:
          return TabProfile();
      }
      return Container();
    }

    Widget _bottomNavigationBarWidget() {
      return BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(LineIcons.home),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: '카테고리',
          ),
          BottomNavigationBarItem(
            icon: Icon(LineIcons.mapMarker),
            label: '내 주변',
          ),
          BottomNavigationBarItem(
            icon: Icon(LineIcons.search),
            label: '검색',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: '마이페이지',
          ),
          BottomNavigationBarItem(
            icon: Icon(LineIcons.safari),
            label: '아이템',
          ),
          BottomNavigationBarItem(icon: Icon(LineIcons.accusoft), label: '프로필'),
          BottomNavigationBarItem(icon: Icon(LineIcons.walking), label: '로그아웃')
        ],
        currentIndex: bottomNavigationBar.currentPage,
        unselectedItemColor: const Color(0xFF161921),
        selectedItemColor: const Color(0xFFF6C544),
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          bottomNavigationBar.updateCurrentPage(index);
          // provider navigation state;
        },
      );
    }

    return Scaffold(
      body: _navigationBody(),
      bottomNavigationBar: _bottomNavigationBarWidget(),
    );
  }
}

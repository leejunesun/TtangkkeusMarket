import 'package:flutter/material.dart';
import 'package:ttangkkeusmarket/screens/home.dart';
import 'package:ttangkkeusmarket/screens/category.dart';
import 'package:ttangkkeusmarket/screens/search.dart';
import 'package:ttangkkeusmarket/screens/mypage.dart';
import 'package:ttangkkeusmarket/widgets/AppBar.dart';

class MyBottomNavBar extends StatefulWidget {
  MyBottomNavBar({Key? key}) : super(key: key);

  @override
  State<MyBottomNavBar> createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  int _selectIndex = 0;

  void _navigateBottomBar(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  final List<Widget> _screens = [
    const HomeScreen(),
    const CategoryScreen(),
    const SearchScreen(),
    const MypageScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //   title: const Text("Bottom Nav bar"),
      // ),
      body: _screens[_selectIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectIndex,
        onTap: _navigateBottomBar,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: '카테고리',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '검색',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: '마이페이지',
          ),
        ],
      ),
    );
  }
}

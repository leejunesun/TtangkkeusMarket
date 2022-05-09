import 'package:flutter/material.dart';
import 'package:ttangkkeusmarket/screens/home.dart';
import 'package:ttangkkeusmarket/screens/category.dart';
import 'package:ttangkkeusmarket/screens/search.dart';
import 'package:ttangkkeusmarket/screens/mypage.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
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
        unselectedItemColor: Color(0xFF161921),
        selectedItemColor: Color(0xFFF6C544),
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

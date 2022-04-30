import 'package:flutter/material.dart';
import 'package:ttangkkeusmarket/screens/recommend.dart';
import 'package:ttangkkeusmarket/screens/newitem.dart';
import 'package:ttangkkeusmarket/screens/bestitem.dart';
import 'package:ttangkkeusmarket/screens/discount.dart';

class MainTapBar extends StatelessWidget {
  const MainTapBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: Column(children: const [
          TabBar(
            tabs: [
              Tab(
                child: Text(
                  "추천",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'NotoSans',
                      fontSize: 18.0,
                      fontWeight: FontWeight.w700),
                ),
              ),
              Tab(
                child: Text(
                  "신상품",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'NotoSans',
                      fontSize: 18.0,
                      fontWeight: FontWeight.w700),
                ),
              ),
              Tab(
                child: Text(
                  "베스트",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'NotoSans',
                      fontSize: 18.0,
                      fontWeight: FontWeight.w700),
                ),
              ),
              Tab(
                child: Text(
                  "할인",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'NotoSans',
                      fontSize: 18.0,
                      fontWeight: FontWeight.w700),
                ),
              )
            ],
          ),
          Expanded(
              child: TabBarView(children: [
            RecommendTab(),
            NewitemTab(),
            BestitemTab(),
            DiscountTab(),
          ]))
        ]),
      ),
    );
  }
}

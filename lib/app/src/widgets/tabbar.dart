import 'package:flutter/material.dart';
import 'package:ttangkkeusmarket/app/src/screens/recommend/recommend_screen.dart';
import 'package:ttangkkeusmarket/app/src/screens/new_item/new_item_screen.dart';
import 'package:ttangkkeusmarket/app/src/screens/best_item/bestitem_screen.dart';
import 'package:ttangkkeusmarket/app/src/screens/discount/discount_screen.dart';


class MainTabBar extends StatelessWidget {
  const MainTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: Column(children: const [
          TabBar(
            indicatorColor: Color(0xFF000000),
            indicatorWeight: 2.5,
            indicatorSize: TabBarIndicatorSize.label,
            tabs: [
              Tab(
                child: Text("추천",
                    style: TextStyle(
                      color: Color(0xff000000),
                      fontFamily: 'NotoSans',
                      fontSize: 18.0,
                      fontWeight: FontWeight.w400,
                    )),
              ),
              Tab(
                child: Text(
                  "신상품",
                  style: TextStyle(
                      color: Color(0xff000000),
                      fontFamily: 'NotoSans',
                      fontSize: 18.0,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Tab(
                child: Text(
                  "베스트",
                  style: TextStyle(
                      color: Color(0xff000000),
                      fontFamily: 'NotoSans',
                      fontSize: 18.0,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Tab(
                child: Text(
                  "할인",
                  style: TextStyle(
                      color: Color(0xff000000),
                      fontFamily: 'NotoSans',
                      fontSize: 18.0,
                      fontWeight: FontWeight.w400),
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

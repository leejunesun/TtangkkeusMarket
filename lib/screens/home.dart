import 'package:flutter/material.dart';
import 'package:ttangkkeusmarket/widgets/AppBar.dart';
import 'package:ttangkkeusmarket/widgets/TapBar.dart';
import 'package:ttangkkeusmarket/screens/recommend.dart';
import 'package:ttangkkeusmarket/screens/newitem.dart';
import 'package:ttangkkeusmarket/screens/bestitem.dart';
import 'package:ttangkkeusmarket/screens/discount.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: BaseAppBar(appBar: AppBar(), title: "땅끗마켓", center: true),
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
                  ),
                ),
              ),
              Tab(
                child: Text(
                  "신상품",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'NotoSans',
                    fontSize: 18.0,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  "베스트",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'NotoSans',
                    fontSize: 18.0,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  "할인",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'NotoSans',
                    fontSize: 18.0,
                  ),
                ),
              )
            ],
          ),
          // Center(
          //     child: Text(
          //   "Home Screen",
          //   style: TextStyle(fontSize: 30),
          // )),
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

 



    // Scaffold(
    //     appBar: BaseAppBar(appBar: AppBar(), title: "땅끗마켓", center: true),
    //     body: Center(
    //         child: Text(
    //       "Home Screen",
    //       style: TextStyle(fontSize: 30),
    //     )))
import 'package:flutter/material.dart';
import 'package:ttangkkeusmarket/widgets/CarouselList.dart';

class RecommendTab extends StatelessWidget {
  const RecommendTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CarouselSliderWidget(),

    );
    // return Container(
    //   color: Colors.orange,
    //   child: const Center(
    //     child: Text(
    //       "RECOMMEND TAB",
    //       style: TextStyle(fontSize: 24, color: Colors.white),
    //     ),
    //   ),

    // );
  }
}

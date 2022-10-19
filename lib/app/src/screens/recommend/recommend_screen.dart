import 'package:flutter/material.dart';
import '../../widgets/text/repetitious_text.dart';
import 'package:ttangkkeusmarket/app/src/widgets/carousel_list.dart';
import 'package:ttangkkeusmarket/app/src/widgets/list_item.dart';

class RecommendTab extends StatelessWidget {
  const RecommendTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          const Expanded(child: CarouselSliderWidget()),
          const SizedBox(
              // height: 100,
              ),
          RepetitiousText("도움이 필요한 상품"),
          const Expanded(child: ListItems()),
        ],
      ),
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

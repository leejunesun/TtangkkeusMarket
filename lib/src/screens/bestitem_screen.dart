import 'package:flutter/material.dart';

class BestitemTab extends StatelessWidget {
  const BestitemTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: Colors.red,
        child: const Center(
          child: Text(
            "BESTITEM TAB",
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

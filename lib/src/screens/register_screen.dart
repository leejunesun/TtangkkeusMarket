import 'package:flutter/material.dart';

import '../widgets/angleleft_appbar.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentWdith = MediaQuery.of(context).size.width;
    final currentHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AngleLeftAppBar(
        appBar: AppBar(),
        title: "회원가입",
        center: true,
      ),
      body: Column(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  // width: 52,
                  // height: 28,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 10, 0, 5),
                      ),
                      Text(
                        '아이디',
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'SF',
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        '*',
                        style: TextStyle(
                            color: Color(0xFFED752E),
                            fontFamily: 'SF',
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
                    ),
                    SizedBox(
                      width: 235,
                      height: 35.0,
                      child: Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.fromLTRB(10, 10, 0, 0),

                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0xFFA2A7B9),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(
                                5.0,
                              ),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 1.0,
                              ),
                            ),
                            hintText: "예: ttangkkeus12",
                            // helperText: "6자 이상의 영문 혹은 영문과 숫자를 조합",
                            hintMaxLines: 1,
                            helperMaxLines: 1,
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 10, 5),
                    ),
                    SizedBox(
                      width: 100.0,
                      height: 35.0,
                      child: Expanded(
                          child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          side: const BorderSide(
                            color: Color(
                              0xFFED752E,
                            ),
                            width: 1.0,
                          ),
                          primary: Colors.transparent,
                          elevation: 0.0,
                          shadowColor: Colors.transparent,
                        ),
                        child: const Text(
                          '중복확인',
                          style: TextStyle(
                            color: Color(
                              0xFFED752E,
                            ),
                            fontFamily: 'SF',
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )),
                    )
                  ],
                ),

                // Row(
                //   mainAxisAlignment: MainAxisAlignment.start,
                //   children: <Widget>[],
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

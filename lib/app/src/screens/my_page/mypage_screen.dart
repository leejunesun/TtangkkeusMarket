import 'package:flutter/material.dart';
import 'package:ttangkkeusmarket/app/src/screens/login/login_screen.dart';
import 'package:ttangkkeusmarket/app/src/widgets/base_appbar.dart';
import 'package:provider/provider.dart';
import 'package:ttangkkeusmarket/app/src/cloud_functions/auth_control.dart';
import 'package:ttangkkeusmarket/app/src/models/auth_model.dart';

class MypageScreen extends StatelessWidget {
  MypageScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final authClient =
        Provider.of<FirebaseAuthProvider>(context, listen: false);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: BaseAppBar(
          appBar: AppBar(),
          title: "마이페이지",
          center: true,
        ),
        body: ListView(scrollDirection: Axis.vertical, children: <Widget>[
          ListTile(
            title: Text('환영합니다!'),
          ),
          ListTile(
            title: const Text('주문내역'),
            trailing: const Icon(Icons.navigate_next),
            onTap: () {},
          ),
          ListTile(
            title: const Text('고객센터'),
            trailing: const Icon(Icons.navigate_next),
            onTap: () {},
          ),
          ListTile(
            title: const Text('상품문의'),
            trailing: const Icon(Icons.navigate_next),
            onTap: () {},
          ),
          ListTile(
            title: const Text('대량주문 문의'),
            trailing: const Icon(Icons.navigate_next),
            onTap: () {},
          ),
          ListTile(
            title: const Text('자주하는질문'),
            trailing: const Icon(Icons.navigate_next),
            onTap: () {},
          ),
          ListTile(
            title: const Text('로그인'),
            trailing: const Icon(Icons.navigate_next),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginScreen()));
            },
          ),
          ListTile(
            title: const Text('로그아웃'),
            trailing: const Icon(Icons.navigate_next),
            onTap: () {
              authClient.logout();
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(const SnackBar(content: Text('logout!')));
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
        ]));
  }
}

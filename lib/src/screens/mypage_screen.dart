import 'package:flutter/material.dart';
import 'package:ttangkkeusmarket/src/widgets/base_appbar.dart';
import 'package:ttangkkeusmarket/src/screens/screen_splash.dart';
import './screen_login.dart';
import 'package:provider/provider.dart';
import 'package:ttangkkeusmarket/src/models/model_auth.dart';
import 'package:ttangkkeusmarket/src/navbar.dart';

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
            title: Text('환영합니다! ' + authClient.user!.email! + '님 '),
            dense: true,
            visualDensity: VisualDensity(vertical: 4),
          ),
          ListTile(
            title: Text('주문내역'),
            trailing: Icon(Icons.navigate_next),
            onTap: () {},
          ),
          ListTile(
            title: Text('고객센터'),
            trailing: Icon(Icons.navigate_next),
            onTap: () {},
          ),
          ListTile(
            title: Text('상품문의'),
            trailing: Icon(Icons.navigate_next),
            onTap: () {},
          ),
          ListTile(
            title: Text('대량주문 문의'),
            trailing: Icon(Icons.navigate_next),
            onTap: () {},
          ),
          ListTile(
            title: Text('자주하는질문'),
            trailing: Icon(Icons.navigate_next),
            onTap: () {},
          ),
          ListTile(
            title: Text('로그아웃'),
            trailing: Icon(Icons.navigate_next),
            onTap: () {
              authClient.logout();
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(SnackBar(content: Text('logout!')));
              Navigator.of(context).pushReplacementNamed('/');
            },
          )
        ]));
  }
}

class LoginOutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authClient =
        Provider.of<FirebaseAuthProvider>(context, listen: false);
    return TextButton(
      onPressed: () async {
        await authClient.logout();
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(SnackBar(content: Text('logout!')));
        Navigator.of(context).pushReplacementNamed('/');
      },
      child: Text('logout'),
    );
  }

}

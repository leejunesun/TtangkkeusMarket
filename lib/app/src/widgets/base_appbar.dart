import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import 'package:ttangkkeusmarket/app/src/screens/cart/cart_screen.dart';
import 'package:ttangkkeusmarket/app/src/screens/home/home_screen.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BaseAppBar(
      {Key? key, required this.appBar, required this.title, this.center = true})
      : super(key: key);

  final AppBar appBar;
  final String title;
  final bool center;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      leading: IconButton(
        onPressed: () => {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const HomeScreen()))
        },
        icon: const Icon(
          LineIcons.home,
          size: 32.0,
          color: Colors.black,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () => {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => CartScreen()))
            // do something
          },
          icon: const Icon(
            LineIcons.shoppingCart,
            size: 32.0,
            color: Colors.black,
          ),
        ),
      ],
      centerTitle: center,
      title: Text(
<<<<<<< HEAD:lib/app/src/widgets/base_appbar.dart
        title,
=======
        "$title",
>>>>>>> develop:lib/src/widgets/base_appbar.dart
        style: const TextStyle(
            color: Colors.black,
            fontFamily: 'SF',
            fontSize: 24.0,
            fontWeight: FontWeight.w700),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}

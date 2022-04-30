import 'package:flutter/material.dart';

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
      actions: [
        IconButton(
          onPressed: () => {
            // do something
          },
          icon: const Icon(Icons.shopping_cart_outlined),
        )
      ],
      centerTitle: center,
      title: Text(
        "$title",
        style: TextStyle(
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

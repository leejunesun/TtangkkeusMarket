import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ttangkkeusmarket/app/src/screens/cart/model/cart_model.dart';

// ignore: must_be_immutable
class CartScreen extends StatelessWidget {
  late String uid = '';

  CartScreen({super.key});

  Future<void> getUid() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    uid = prefs.getString('uid') ?? '';
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    getUid();
    return FutureBuilder(
      future: cartProvider.fetchCartItemsOrCreate(uid),
      builder: (context, snapshot) {
        if (cartProvider.cartItems.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.builder(
            itemCount: cartProvider.cartItems.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  Navigator.pushNamed(context, '/detail',
                      arguments: cartProvider.cartItems[index]);
                },
                title: Text(cartProvider.cartItems[index].title),
                subtitle: Text(cartProvider.cartItems[index].price.toString()),
                leading: Image.network(cartProvider.cartItems[index].imageUrl),
                trailing: InkWell(
                  onTap: () {
                    cartProvider.removeCartItem(
                        uid, cartProvider.cartItems[index]);
                  },
                  child: const Icon(Icons.delete),
                ),
              );
            },
          );
        }
      },
    );
  }
}

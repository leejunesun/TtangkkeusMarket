import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ttangkkeusmarket/app/src/models/item_provider_model.dart';

class TabHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final itemProvider = Provider.of<ItemProvider>(context);
    return FutureBuilder(
      future: itemProvider.fetchItems(),
      builder: (context, snapshots) {
        if (itemProvider.items.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1 / 1.5,
              ),
              itemCount: itemProvider.items.length,
              itemBuilder: (context, index) {
                return GridTile(
                    child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/detail',
                        arguments: itemProvider.items[index]);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(itemProvider.items[index].imageUrl),
                        Text(
                          itemProvider.items[index].title,
                          style: const TextStyle(fontSize: 20),
                        ),
                        Text(
                          '${itemProvider.items[index].price}원',
                          style: const TextStyle(fontSize: 16, color: Colors.red),
                        )
                      ],
                    ),
                  ),
                ));
              });
        }
      },
    );
  }
}

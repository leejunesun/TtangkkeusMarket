import 'package:flutter/material.dart';
import 'package:ttangkkeusmarket/app/src/models/item_provider_model.dart';
import 'package:ttangkkeusmarket/app/src/models/item_model.dart';
import 'package:provider/provider.dart';

class ListItems extends StatelessWidget {
  const ListItems({Key? key}) : super(key: key);

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
          return ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(10),
              itemCount: itemProvider.items.length,
              separatorBuilder: (context, index) {
                return const SizedBox(width: 12);
              },
              itemBuilder: (context, index) {
                return GridTile(
                    child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/detail',
                        arguments: itemProvider.items[index]);
                  },
                  child: SizedBox(
                    width: 205.0,
                    height: 30.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(itemProvider.items[index].imageUrl),
                        Text(
                          itemProvider.items[index].title,
                          style: const TextStyle(fontSize: 20),
                        ),
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

Widget buildCard(int index) => Container(
      color: Colors.amber,
      width: 115.0,
      height: 138.0,
      child: Center(
        child: Text('$index'),
      ),
    );
// SingleChildScrollView(
//         scrollDirection: Axis.horizontal,
//         padding: const EdgeInsets.all(10),
//         child: Row(
//           children: [
//             buildCard(1),
//             const SizedBox(width: 10),
//             buildCard(2),
//             const SizedBox(width: 10),
//             buildCard(3),
//             const SizedBox(width: 10),
//             buildCard(4),
//             const SizedBox(width: 10),
//             buildCard(5),
//             const SizedBox(width: 10),
//             buildCard(6),
//             const SizedBox(width: 10),
//           ],
//         ),
//       ),
import 'package:flutter/material.dart';

import '../classes/product.dart';

class ProductListTile extends StatelessWidget {
  final Product product;
  const ProductListTile({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        title: Text(product.title),
        subtitle: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(product.description),
            Row(
              children: [
                const Text(
                  'Price: ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(product.price.toString()),
              ],
            ),
            Row(
              children: [
                const Text(
                  'Category: ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(product.category),
              ],
            ),
            Row(
              children: [
                const Text(
                  'Rating: ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('${product.rating['rate']} (${product.rating['count']})'),
              ],
            ),
          ],
        ),
        leading: Image.network(product.image, width: 50),
      ),
    );
  }
}

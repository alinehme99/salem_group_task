import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salem_group_task/classes/product.dart';
import 'package:salem_group_task/custom_widgets/product_list_tile.dart';
import 'package:salem_group_task/providers/general_provider.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late Future<List<Product>> getProducts;

  @override
  void initState() {
    // TODO: implement initState
    getProducts =
        Provider.of<GeneralProvider>(context, listen: false).getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: FutureBuilder<List<Product>>(
        future: getProducts,
        builder: (BuildContext context, AsyncSnapshot<List<Product>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }
          if (snapshot.hasError) {
            return Center(
              child: Text('${snapshot.error}'),
            );
          }

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  return ProductListTile(product: snapshot.data![index]);
                }),
          );
        },
      ),
    );
  }
}

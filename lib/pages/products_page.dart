import 'package:flutter/material.dart';
import 'package:gastosappg15/db/db_helper_products.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // await DbHelperProducts().initDatabase();
          DbHelperProducts dbHelperProducts = DbHelperProducts();
          dbHelperProducts.insertProduct("Laptop", 2500.00, 10);
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:gastosappg15/db/db_helper_products.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // await DbHelperProducts().initDatabase();
          DbHelperProducts dbHelperProducts = DbHelperProducts();
          // dbHelperProducts.insertProduct("Teclado", 150.00, 2);
          List<Map<String, dynamic>> productosObtenidos = await dbHelperProducts
              .obtenerProductos();
          ;

          print(productosObtenidos);
        },
      ),
    );
  }
}

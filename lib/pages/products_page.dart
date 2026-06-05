import 'package:flutter/material.dart';
import 'package:gastosappg15/db/db_helper_products.dart';
import 'package:gastosappg15/models/product_model.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // USO CON PATRÓN SINGLETON

          ProductModel producto1 = ProductModel(
            id: 4,
            nombre: "Zapatillas Adidas",
            precio: 120.00,
            stock: 15,
          );
          // await DbHelperProducts.instance.insertProduct(producto1);
          await DbHelperProducts.instance.updateProduct(producto1);
          await DbHelperProducts.instance.deleteProduct(6);

          await DbHelperProducts.instance.getProductos().then((value) {
            List<ProductModel> productsList = value;
            print(value);
            print(productsList.length);
            productsList.forEach((element) {
              print(element.nombre);
            });
          });

          // USO SIN PATRÓN SINGLETON
          // // await DbHelperProducts().initDatabase();
          // DbHelperProducts dbHelperProducts = DbHelperProducts();
          // // dbHelperProducts.insertProduct("Teclado", 150.00, 2);
          // // dbHelperProducts.actualizarProducto(2, "Ratón Gamer");
          // dbHelperProducts.eliminarProducto(3);
          // List<Map<String, dynamic>> productosObtenidos = await dbHelperProducts
          //     .obtenerProductos();
          // ;

          // print(productosObtenidos);
        },
      ),
    );
  }
}

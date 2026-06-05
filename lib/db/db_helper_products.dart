import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

// DB SIN PATRÓN SINGLETON

class DbHelperProducts {
  Database? myProductsDatabase;

  Future<Database> initDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    print(directory);
    String pathDatabase = join(directory.path, "ProductsDB.db");
    return openDatabase(
      pathDatabase,
      version: 1,
      onCreate: (Database db, int version) {
        db.execute("""
          CREATE TABLE productos (
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              nombre TEXT NOT NULL,
              precio REAL NOT NULL,
              stock INTEGER NOT NULL
            )

        """);
      },
    );
  }

  // INSERTAR
  Future<void> insertProduct(String nombre, double precio, int stock) async {
    final db = await initDatabase();
    db.insert("productos", {
      "nombre": nombre,
      "precio": precio,
      "stock": stock,
    });
  }

  // OBTENER REGISTROS
  Future<List<Map<String, dynamic>>> obtenerProductos() async {
    final db = await initDatabase();
    return db.rawQuery("SELECT * FROM productos");
    // return db.rawQuery("SELECT nombre, stock FROM productos WHERE stock < 11");
    // return db.query(
    //   "productos",
    //   where: "nombre = 'Teclado' ",
    //   columns: ["id,nombre"],
    // );
  }

  // ACTUALIZACIÓN
  Future<void> actualizarProducto(int id, String nombre) async {
    final db = await initDatabase();
    await db.update(
      "productos",
      {"nombre": nombre},
      where: "id = ?",
      whereArgs: [id],
    );
  }

  // ELIMINACIÓN
  Future<void> eliminarProducto(int id) async {
    final db = await initDatabase();
    await db.delete("productos", where: "id = ? ", whereArgs: [id]);
  }
}

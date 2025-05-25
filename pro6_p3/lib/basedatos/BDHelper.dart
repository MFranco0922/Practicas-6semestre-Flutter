import 'dart:ffi';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class BDHelper {
  static final BDHelper _instance = BDHelper._internal();
  factory BDHelper() => _instance;

  BDHelper._internal();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), 'abarrotes.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          Create table productos(
          codigo TEXT PRIMARY KEY,
          nombre TEXT NOT NULL,
          precio REAL NOT NULL
          )
      ''');
      },
    );
  }

  Future<int> insertarProducto(
      String codigo, String nombre, double precio) async {
    final db = await database;

    return await db.insert(
      'productos', //NOMBRE DE TABLA
      {
        'codigo': codigo, //CAMPOS
        'nombre': nombre,
        'precio': precio
      },
    );
  }

  //RETRNAR LA BASE DE DATOS A LA TABLA USUARIOS //PARA MOSTRAR
  Future<List<Map<String, dynamic>>> obtenerProductos() async {
    final db = await database;
    return await db.query('productos'); // SELECIONAR DATOS DE LA TABLA
  }

  //METODO ELIMINAR USUARIOS

  Future<int> eliminarProducto(String codigo) async {
    final db = await database;
    return await db
        .delete('productos', where: 'codigo = ?', whereArgs: [codigo]);
  }
}

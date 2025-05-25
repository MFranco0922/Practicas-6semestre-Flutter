import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Basedatos {
  static final Basedatos _instance = Basedatos._internal();
  factory Basedatos() => _instance;

  Basedatos._internal();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), 'tareas.db');
    return await openDatabase(
      path,
      version: 2,
      onCreate: (db, version) async {
        await db.execute('''
          Create table productos(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          producto TEXT NOT NULL,
          precio TEXT NOT NULL,
          cantidad TEXT NOT NULL
          )
      ''');
      },
    );
  }
}

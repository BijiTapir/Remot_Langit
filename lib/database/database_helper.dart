import 'dart:async';
import 'database_model.dart';
import 'package:sqflite/sqflite.dart';
// import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final _dbName = 'myDatabase.db';
  static final _dbVersion = 1;
  static final _tableName = 'myTable';
  static final columnId = '_id';
  static final columnName = 'name';

  static final DatabaseHelper instance = DatabaseHelper.init();

  static Database? _database;
  DatabaseHelper.init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('movie.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';

    await db.execute('''
      CREATE TABLE $tableWilayah(
        ${WilayahFields.id} $idType,
        ${WilayahFields.kota} $textType,
        ${WilayahFields.negara} $textType,
        ${WilayahFields.img} $textType
      )''');
  }

// {
//   "_id":12,
//   "name":"saheb"
// }

  Future<WilayahModel> create(WilayahModel wilayah) async {
    final db = await instance.database;
    final id = await db.insert(tableWilayah, wilayah.toJson());
    return wilayah.copy(id: id);
  }

  Future<WilayahModel> read(String? kota) async {
    final db = await instance.database;

    final maps = await db.query(
      tableWilayah,
      columns: WilayahFields.values,
      where: '${WilayahFields.kota} = ?',
      whereArgs: [kota],
    );

    if (maps.isNotEmpty) {
      return WilayahModel.fromJson(maps.first);
    } else {
      throw Exception('ID $kota not found');
    }
  }

  Future<List<WilayahModel>> readAll() async {
    final db = await instance.database;
    final result = await db.query(tableWilayah);
    return result.map((json) => WilayahModel.fromJson(json)).toList();
  }

  update(WilayahModel wilayahModel) async {
    final db = await instance.database;
    try {
      db.rawUpdate('''
    UPDATE ${tableWilayah} 
    SET ${WilayahFields.kota} = ?, ${WilayahFields.negara} = ?
    WHERE ${WilayahFields.id} = ?
    ''', [
        WilayahFields.id,
        WilayahFields.kota,
        WilayahFields.negara,
        WilayahFields.img
      ]);
    } catch (e) {
      print('error: ' + e.toString());
    }
  }

  delete(String? kota) async {
    final db = await instance.database;
    try {
      await db.delete(
        tableWilayah,
        where: '${WilayahFields.kota} = ?',
        whereArgs: [kota],
      );
      print("finish");
    } catch (e) {
      print(e);
    }
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}

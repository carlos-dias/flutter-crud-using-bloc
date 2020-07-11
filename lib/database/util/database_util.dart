import 'package:crudbloc/models/stuff_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'package:path/path.dart';

class DataBaseUtil {
  static Database _db;
  static const int _VERSION = 1;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  initDb() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, 'crud_bloc.db');
    Database db = await openDatabase(path, onCreate: _onCreate, version: _VERSION);
    return db;
  }

  void _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE ${StuffModel.TABLE_STUFF} (${StuffModel.COLUMN_ID} INTEGER PRIMARY KEY, ${StuffModel.COLUMN_NAME} TEXT, ${StuffModel.COLUMN_DESCRIPTION} TEXT, ${StuffModel.COLUMN_FAVORITED} INTEGER)");
  }

  static final DataBaseUtil _instance = DataBaseUtil._internal();

  factory DataBaseUtil() => _instance;

  DataBaseUtil._internal();
}

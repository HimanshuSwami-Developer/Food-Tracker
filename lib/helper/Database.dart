import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'food_track.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  // Create the 'food_track' table
  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE food_track (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        food_name TEXT NOT NULL,
        calories INTEGER NOT NULL,
        date TEXT NOT NULL
      )
    ''');
    print("Database 'food_track.db' and 'food_track' table created!");
  }
}

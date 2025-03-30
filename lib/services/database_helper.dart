import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/room_model.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('rooms.db');
    return _database!;
  }

  Future<Database> _initDB(String fileName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, fileName);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE rooms (
        id INTEGER PRIMARY KEY,
        name TEXT,
        image TEXT,
        price REAL,
        rate REAL,
        available INTEGER,
        description TEXT,
        images TEXT,
        tv INTEGER,
        shower INTEGER,
        wifi INTEGER,
        breakfast INTEGER,
        status TEXT DEFAULT 'available'
      )
    ''');
  }

  Future<void> insertRoom(Room room) async {
    final db = await instance.database;
    await db.insert('rooms', room.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Room>> fetchRooms() async {
    final db = await instance.database;
    final result = await db.query('rooms');
    return result.map((map) => Room.fromMap(map)).toList();
  }

  static Future<void> deleteDatabaseFile() async {
    final path = join(await getDatabasesPath(), 'rooms.db');
    await databaseFactory.deleteDatabase(path);
  }

  static Future<void> deleteRoomsTable() async {
    await _database!.execute('DROP TABLE IF EXISTS rooms');
  }

  static Future getRoomsByStatus() async {
    print(await _database!.rawQuery('SELECT * FROM rooms'));
    return await _database!.rawQuery('SELECT * FROM rooms');
  }

  static Future<void> deleteRooms() async {
    await _database!.rawDelete('DELETE FROM rooms');
  }

  static Future<void> createRoomsTable() async {
    await _database!.execute('''
      CREATE TABLE rooms (
        id INTEGER PRIMARY KEY,
        name TEXT,
        image TEXT,
        price REAL,
        rate REAL,
        available INTEGER,
        description TEXT,
        images TEXT,
        tv INTEGER,
        shower INTEGER,
        wifi INTEGER,
        breakfast INTEGER,
        status TEXT
      )
    ''');
  }

  static Future<void> updateRoomStatus({required int id, required String status}) async {
    await _database!.update('rooms', {
      'status': status,
    }, where: 'id = ?', whereArgs: [id]);
  }
}

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseService {
  static Future<Database> _openDatabase() async {
    final path = join(await getDatabasesPath(), 'user_data.db');
    return openDatabase(path, onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE user_data(id INTEGER PRIMARY KEY, user_code TEXT, user_display_name TEXT)',
      );
    }, version: 1);
  }

  static Future<void> saveUserData(Map<String, dynamic> userData) async {
    final db = await _openDatabase();

    await db.insert(
      'user_data',
      {
        'user_code': userData['User_Code'],
        'user_display_name': userData['User_Display_Name'],
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<Map<String, dynamic>>> getUserData() async {
    final db = await _openDatabase();
    return db.query('user_data');
  }
}

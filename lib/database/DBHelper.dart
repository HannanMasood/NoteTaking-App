import 'package:noteapp/model/db_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

//DBHelper class

class NoteDatabase {
  static const _dbname = 'notes_database.db';
  static const _tablename = 'notes';

  static Future<Database> _database() async {
    final database = openDatabase(
      join(await getDatabasesPath(), _dbname),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE $_tablename(id INTEGER PRIMARY KEY, title TEXT, content TEXT)',
        );
      },
      version: 1,
    );
    return database;
  }

// insert method

  static insert({required Note note}) async {
    final db = await _database();
    await db.insert(_tablename, note.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }
// Retrieve method

  static Future<List<Note>> getNotes() async {
    final db = await _database();
    final List<Map<String, dynamic>> maps = await db.query(_tablename);
    return List.generate(maps.length, (i) {
      return Note(
        id: maps[i]['id'] as int,
        title: maps[i]['title'] as String,
        content: maps[i]['content'] as String,
      );
    });
  }
// update method

  static updateNote({required Note note}) async {
    final db = await _database();
    await db
        .update(_tablename, note.toMap(), where: 'id=?', whereArgs: [note.id]);
  }

// delete method

  static Future<void> deleteNotes({required Note note}) async {
    final db = await _database();
    await db.delete(
      _tablename,
      where: 'id = ?',
      whereArgs: [note.id],
    );
  }
}

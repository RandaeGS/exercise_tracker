import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'exercise_model.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  static final List<Exercise> baseExercises = [
    Exercise(id: 1, name: 'Chest', amount: 0, removeAmount: 10),
    Exercise(id: 2, name: 'Shoulders', amount: 0, removeAmount: 10),
    Exercise(id: 3, name: 'Legs', amount: 0, removeAmount: 10),
    Exercise(id: 4, name: 'Back', amount: 0, removeAmount: 10),
    Exercise(id: 5, name: 'Abs', amount: 0, removeAmount: 10),
    Exercise(id: 6, name: 'Biceps', amount: 0, removeAmount: 10),
    Exercise(id: 7, name: 'Triceps', amount: 0, removeAmount: 10),
  ];

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('exercises.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE exercises(
        id INTEGER PRIMARY KEY,
        name TEXT NOT NULL,
        amount INTEGER NOT NULL,
        removeAmount INTEGER NOT NULL
      )
    ''');

    for (var exercise in baseExercises) {
      await db.insert('exercises', exercise.toMap());
    }
  }

  Future<List<Exercise>> getAllExercises() async {
    final db = await instance.database;
    final result = await db.query('exercises');
    return result.map((map) => Exercise.fromMap(map)).toList();
  }

  Future<Exercise?> getExercise(int id) async {
    final db = await instance.database;
    final maps = await db.query(
      'exercises',
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Exercise.fromMap(maps.first);
    }
    return null;
  }

  Future<int> update(Exercise exercise) async {
    final db = await instance.database;
    return db.update(
      'exercises',
      exercise.toMap(),
      where: 'id = ?',
      whereArgs: [exercise.id],
    );
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}

import 'package:logger/logger.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../../../domain/entities/goal.dart';

class GoalProvider {
  static final Logger _logger = Logger();
  static final GoalProvider _instance = GoalProvider._internal();
  Database? _database;

  factory GoalProvider() => _instance;

  GoalProvider._internal() {
    init();
  }

  Future<void> init() async {
    String path = join(await getDatabasesPath(), 'goal.db');
    _database = await openDatabase(path, version: 2, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $tableGoal (
        $columnId TEXT PRIMARY KEY,
        $columnContent TEXT NOT NULL,
        $columnGoalDate INTEGER NOT NULL,
        $columnPriority INTEGER NOT NULL DEFAULT 99,
        $columnDone INTEGER DEFAULT 0
      )
    ''');
  }

  Future<Database> get database async {
    if (_database == null) {
      await init();
    }
    return _database!;
  }

  Future<void> insert(Goal goal) async {
    final db = await database;
    await db.insert('goal', goal.toMap());
  }

  Future<List<Goal>> getGoals() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('goal');

    _logger.d(maps);
  
    return List.generate(maps.length, (i) {
      var goalDate = DateTime.fromMillisecondsSinceEpoch(maps[i][columnGoalDate]);
      return Goal(
        id: maps[i][columnId],
        content: maps[i][columnContent],
        goalDate: goalDate,
        priority: maps[i][columnPriority],
        done: maps[i][columnDone] == 1,
      );
    });
  }

  Future<Goal> getGoal(Goal goal) async {
    final db = await database;
    final List<Map<String, dynamic>> maps =
        await db.query('goal', where: '$columnId = ?', whereArgs: [goal.getId]);
    return Goal(
      id: maps[0][columnId],
      content: maps[0][columnContent],
      goalDate: maps[0][columnGoalDate],
      priority: maps[0][columnPriority],
      done: maps[0][columnDone] == 1,
    );
  }

  Future<void> update(Goal goal) async {
    final db = await database;
    await db.update(
      'goal',
      goal.toMap(),
      where: '$columnId = ?',
      whereArgs: [goal.getId],
    );
  }

  Future<void> remove(Goal goal) async {
    final db = await database;
    await db.delete(
      'goal',
      where: '$columnId = ?',
      whereArgs: [goal.getId],
    );
  }

  Future<void> removeAll() async {
    final db = await database;
    await db.delete('goal');
  }
}

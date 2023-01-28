import 'package:sqflite/sqflite.dart';
import '../../../domain/entities/plan.dart';

class PlanProvider {
  late Database db;

  Future open(String path) async {
    db = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
create table $tablePlan (
  $columnId integer primary key autoincrement,
  $columnTitle text not null,
  $columnDone integer not null)
''');
      },
    );
  }

  // insert to sqlite, return inserted id
  Future<Plan> insert(Plan plan) async {
    plan.id = await db.insert(tablePlan, plan.toMap());
    return plan;
  }

  // get plan by id
  Future<Plan> getPlan(int id) async {
    // query(table, columns, where, whereArgs, groupBy, having, orderBy, limit, offset)
    List<Map<String, dynamic>> maps = await db.query(tablePlan,
        columns: [columnId, columnDone, columnTitle],
        where: '$columnId = ?',
        whereArgs: [id]);
    if (maps.isNotEmpty) {
      return Plan.fromMap(maps.first);
    }
    throw Exception('Failed to load plan');
  }

  // delete plan by id
  Future<int> delete(int id) async {
    // delete(table, where, whereArgs)
    return await db.delete(tablePlan, where: '$columnId = ?', whereArgs: [id]);
  }

  // update plan by id
  Future<int> update(Plan plan) async {
    // update(table, map, where, whereArgs)
    return await db.update(tablePlan, plan.toMap(),
        where: '$columnId = ?', whereArgs: [plan.id]);
  }

  // close database
  Future close() async => db.close();
}

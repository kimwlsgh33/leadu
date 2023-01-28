const tablePlan = 'plan';
const columnId = '_id';
const columnTitle = 'title';
const columnDone = 'done';
const columnCreatedAt = 'created_at';
const columnUpdatedAt = 'updated_at';
const columnOrder = 'order';

class Plan {
  int? id;
  String title;
  bool done;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? order; 

  Plan({
    this.id,
    required this.title,
    this.done = false,
    this.createdAt,
    this.updatedAt,
    this.order,
  });

  Map<String, Object?> toMap() {
    var map = <String, dynamic>{
      columnTitle: title,
      columnDone: done == true ? 1 : 0
    };

    if (id != null) {
      map[columnId] = id;
    }

    if (createdAt != null) {
      map[columnCreatedAt] = createdAt!.toIso8601String();
    }

    if (updatedAt != null) {
      map[columnUpdatedAt] = updatedAt!.toIso8601String();
    }

    if (order != null) {
      map[columnOrder] = order;
    }

    return map;
  }

  Plan.fromMap(Map<String, dynamic> map)
      : id = map[columnId],
        title = map[columnTitle],
        done = map[columnDone] == 1,
        createdAt = DateTime.parse(map[columnCreatedAt]),
        updatedAt = DateTime.parse(map[columnUpdatedAt]),
        order = map[columnOrder];
}


const tableGoal = 'goal';
const columnId = 'id';
const columnContent = 'content';
const columnGoalDate = 'goal_date';
const columnPriority = 'priority';
const columnDone = 'done';

class Goal {
  String id; // 목표를 구분하기 위한 id
  String content; // 목표 내용
  DateTime goalDate; // 목표 완료 날짜
  int priority; // 목표 우선순위
  bool done; // 목표 완료 여부

  Goal({
    required this.id,
    required this.content,
    required this.goalDate,
    this.priority = 99,
    this.done = false,
  });

  Goal.fromMap(Map<String, dynamic> map)
      : id = map[columnId],
        content = map[columnContent],
        goalDate = DateTime.parse(map[columnGoalDate]),
        priority = map[columnPriority],
        done = map[columnDone] == 1;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnContent: content,
      columnGoalDate: goalDate.microsecondsSinceEpoch, // convert to int
      columnPriority: priority,
      columnDone: done ? 1 : 0,
    };
    if (id != null) {
      map[columnId] = id;
    }
    return map;
  }

  // getter
  String get getId => id;
}

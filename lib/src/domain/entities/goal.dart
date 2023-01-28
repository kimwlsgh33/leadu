import '../entities/category.dart';

class Goal {
  final String content;
  bool isDone;
  Category category;

  Goal({
    required this.content,
    this.isDone = false,
    required this.category,
  });
}

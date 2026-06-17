import 'package:practiceflutter/task_model.dart';

abstract class TaskEvent {}
class AddTask extends TaskEvent{
  final String task;
  final int price;
  final int quanity;
  AddTask(this.task,this.price,this.quanity);
}
class DeleteTask extends TaskEvent{
 final TaskModel task;
  DeleteTask(this.task);
}
abstract class TaskEvent {}
class AddTask extends TaskEvent{
  final String task;
  AddTask({required this.task});
}
class DeleteTask extends TaskEvent{
final String task;
  DeleteTask({required this.task});
}
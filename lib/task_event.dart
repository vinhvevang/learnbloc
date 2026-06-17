abstract class TaskEvent {}
class addTask extends TaskEvent{
  final String task;
  final int price;
  final int quanity;
  addTask(this.task,this.price,this.quanity);
}
class deleteTask extends TaskEvent{
  final String task;
   final int price;
  final int quanity;
  deleteTask(this.task,this.price,this.quanity);
}
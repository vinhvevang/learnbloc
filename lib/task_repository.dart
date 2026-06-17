import 'package:practiceflutter/task_model.dart';

class TaskRepository {
  final List <TaskModel> _tasks  =[];

 List<TaskModel> getTask(){
    return List.from(_tasks);
  }
  void addTask(TaskModel task){
      _tasks.add(task);
  }

  void deleteTask(TaskModel task){
    _tasks.remove(task);
  }
}
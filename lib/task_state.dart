import 'package:practiceflutter/task_model.dart';

enum TaskStatus{
  initial,
  loading,
  success,
  failure
}



class TaskState {
  final List<TaskModel>  tasks;
  final TaskStatus status;
  final String? message;
  const TaskState({
    this.tasks = const [],
    this.status = TaskStatus.initial,
    this.message}
  );

  TaskState copyWith({
       List<TaskModel>? tasks,
   TaskStatus? status,
   String? message
  }){
    return TaskState(
      tasks: tasks ?? this.tasks,
      status: status ?? this.status,
      message: message ?? this.message
    );
  }
}
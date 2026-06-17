import 'package:bloc/bloc.dart';
import 'package:practiceflutter/task_event.dart';
import 'package:practiceflutter/task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(TaskState(tasks: [])) {
    on<AddTask>((event, emit) {
       final List<String> newTasks = List<String>.from(state.tasks);
       newTasks.add(event.task);
    emit(TaskState(tasks: newTasks));
    });
  on<DeleteTask>((event,emit){
  final List<String> newTasks = List<String>.from(state.tasks);
       newTasks.remove(event.task);
    emit(TaskState(tasks: newTasks));
  });
  }
  void addTask(String task) {
 
  }
  void deleteTask(String task){
      
  }
}

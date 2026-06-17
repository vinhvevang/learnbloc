import 'package:bloc/bloc.dart';
import 'package:practiceflutter/task_event.dart';
import 'package:practiceflutter/task_state.dart';

class TaskBloc extends Bloc<TaskEvent,TaskState>{
  TaskBloc(): super (TaskState(tasks: [],price: [],quanity: [])){
    on<addTask>((event, emit) {
      final newTasks = List<String>.from(state.tasks);
      final newPrice = List<int>.from(state.price);
      final newQuanity = List<int>.from(state.quanity); 
      newTasks.add(event.task);
      newPrice.add(event.price);
      newQuanity.add(event.quanity);
      emit(TaskState(tasks: newTasks,price: newPrice, quanity: newQuanity));
    });
     on<deleteTask>((event, emit) {
      final newTasks = List<String>.from(state.tasks);
      final newPrice = List<int>.from(state.price);
      final newQuanity = List<int>.from(state.quanity); 
      newTasks.remove(event.task);
      newPrice.remove("${event.price}");
      newQuanity.remove("${event.quanity}");
          emit(TaskState(tasks: newTasks,price: newPrice,quanity: newQuanity));
    });
  }
}
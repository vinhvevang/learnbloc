import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practiceflutter/task_event.dart';
import 'package:practiceflutter/task_event.dart';
import 'package:practiceflutter/task_model.dart';
import 'package:practiceflutter/task_repository.dart';
import 'package:practiceflutter/task_state.dart';

class TaskBloc extends Bloc<TaskEvent,TaskState>{
 TaskRepository repository;
  TaskBloc(this.repository) : super(TaskState()){
    on<AddTask>(_addTask);
    on<DeleteTask>(_deleteTask);
  }


  void _addTask( AddTask event, Emitter<TaskState> emit){
      emit(state.copyWith(
        status: TaskStatus.loading
      ));
      final name = event.task.trim();
      final price = event.price;
      final quanity = event.quanity;
      if(name.isEmpty || price == null || quanity == null){
        
        state.copyWith(
          status: TaskStatus.failure,
            message: "Du lieu khong hop le"
        );
        return;
      }
     repository.addTask(TaskModel(task: name, price: price, quanity: quanity));
     emit (
      state.copyWith(
        status: TaskStatus.success,
        tasks:  repository.getTask(),
        message: "them thanh cong"
        
      )
     );
  }

  void _deleteTask(DeleteTask event, Emitter<TaskState> emit){

      repository.deleteTask(event.task);
      emit (
        state.copyWith(
            tasks: repository.getTask(),
            status: TaskStatus.success
        )
      );
  }
}

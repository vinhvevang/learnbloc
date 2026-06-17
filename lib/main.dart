import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practiceflutter/card.dart';
import 'package:practiceflutter/task_bloc.dart';
import 'package:practiceflutter/task_event.dart';
import 'package:practiceflutter/task_state.dart';

void main() {
  runApp(BlocProvider(create: (_) => TaskBloc(), child: MaterialApp(home: MyApp())));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Nhap nhiem vu"),
                actions: [
                  TextFormField(controller: controller,),
                  TextButton(onPressed: () {
                  context.read<TaskBloc>().add(AddTask(task: controller.text.toString()));
                }, child: Text("Them"))],
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
      body: BlocBuilder<TaskBloc, TaskState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.tasks.length,
            itemBuilder: (context, i) {
              return CardTask(
                name: state.tasks[i],
                ondelete: () {
                  context.read<TaskBloc>().add(
                    DeleteTask(task: state.tasks[i]),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

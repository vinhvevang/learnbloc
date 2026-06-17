import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practiceflutter/card_task.dart';
import 'package:practiceflutter/task_bloc.dart';
import 'package:practiceflutter/task_event.dart';
import 'package:practiceflutter/task_state.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController controller = TextEditingController();
  TextEditingController controllerPrice = TextEditingController();
  TextEditingController controllerQuanity = TextEditingController();
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
                  TextFormField(
                    decoration: InputDecoration(label: Text("ten san pham")),
                    controller: controller,
                  ),
                  TextFormField(
                    decoration: InputDecoration(label: Text("nhap gia")),
                    controller: controllerPrice,
                  ),
                  TextFormField(
                    decoration: InputDecoration(label: Text("nhap so luong")),
                    controller: controllerQuanity,
                  ),
                  TextButton(
                    onPressed: () {
                      context.read<TaskBloc>().add(
                       AddTask(controller.text, int.parse(controllerPrice.text), int.parse(controllerQuanity.text))
                      );
                    },
                    child: Text("Them"),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
      body: BlocBuilder<TaskBloc, TaskState>(
        builder: (context, state) {
          return GridView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: state.tasks.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // số cột
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1.2, // tỉ lệ rộng/cao
            ),

            itemBuilder: (context, i) {
              return CardTask(
                name: state.tasks[i].task ,
                price:state.tasks[i].price ,
                quanity:state.tasks[i].quanity ,
                onDeleted:
                    () => context.read<TaskBloc>().add(
                     DeleteTask(state.tasks[i])
                    ),
              );
            },
          );
        },
      ),
    );
  }
}

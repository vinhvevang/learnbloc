import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practiceflutter/my_app.dart';
import 'package:practiceflutter/task_bloc.dart';

void main(){
  runApp(
    BlocProvider(create: (_)=> TaskBloc(),
    child: MaterialApp(home: MyApp(),),
    )
  );
}
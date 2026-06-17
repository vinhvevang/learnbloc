import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardTask extends StatelessWidget {
  String name;
  final VoidCallback ondelete;
   CardTask({super.key, required this.name,required this.ondelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(20)
      ),
      margin: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(name),
          ElevatedButton(onPressed: ondelete, child: Icon(Icons.delete_outline))
        ],
      ),
    );
  }
}

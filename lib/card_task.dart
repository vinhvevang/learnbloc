import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardTask extends StatelessWidget {
  String name;
  int price;
  int quanity;
  final VoidCallback onDeleted;
  CardTask({
    super.key,
    required this.name,
    required this.onDeleted,
    required this.price,
    required this.quanity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey,width: 2)
      ),
      child: Column(
        children: [
          Text(name),
          Text("$price"),
          Text("$quanity"),

          IconButton(onPressed: onDeleted, icon: Icon(Icons.delete)),
        ],
      ),
    );
  }
}

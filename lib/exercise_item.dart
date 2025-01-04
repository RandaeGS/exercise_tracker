import 'package:flutter/material.dart';

class ExerciseItem extends StatefulWidget {
  final String name;

  const ExerciseItem({super.key, required this.name});

  @override
  State<ExerciseItem> createState() => _ExerciseItemState();
}

class _ExerciseItemState extends State<ExerciseItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      elevation: 4.0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
          side: BorderSide(
            style: BorderStyle.solid,
            color: Colors.white60,
          )),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.name,
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Text(
                    "100",
                    overflow: TextOverflow.fade,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () => {},
                    label: Text("10"),
                    icon: Icon(Icons.remove),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      textStyle: TextStyle(color: Colors.white)
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

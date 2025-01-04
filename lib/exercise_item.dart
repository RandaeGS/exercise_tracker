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
      color: Color(0xff1C2633),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
          side: BorderSide(
            style: BorderStyle.solid,
            color: Colors.white60,
          )),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  widget.name,
                  style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Row(
                  children: [
                    Container(
                      height: 36,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          border: Border(
                              left: BorderSide(color: Colors.white60),
                              top: BorderSide(color: Colors.white60),
                              bottom: BorderSide(color: Colors.white60))),
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: Text(
                          "100",
                          overflow: TextOverflow.fade,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () => {},
                      label: Text(
                        "10",
                        style: TextStyle(color: Colors.white),
                      ),
                      icon: Icon(
                        Icons.remove,
                        color: Colors.white,
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        minimumSize: Size.square(36),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(6),
                              bottomRight: Radius.circular(6)),
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

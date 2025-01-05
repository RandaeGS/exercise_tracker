import 'package:flutter/material.dart';

import 'database_helper.dart';
import 'exercise_model.dart';

class ExerciseItem extends StatefulWidget {
  final String name;
  final int amount;
  final int removeAmount;
  final int id;

  const ExerciseItem(
      {super.key,
      required this.name,
      required this.amount,
      required this.removeAmount,
      required this.id});

  @override
  State<ExerciseItem> createState() => _ExerciseItemState();
}

class _ExerciseItemState extends State<ExerciseItem> {
  late int currentAmount;

  @override
  void initState() {
    super.initState();
    currentAmount = widget.amount;
  }

  @override
  void didUpdateWidget(covariant ExerciseItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.amount != widget.amount){
      setState(() {
        currentAmount = widget.amount;
      });
    }
  }

  Future<void> decreaseRepAmount() async {

    if (widget.amount - widget.removeAmount < 0) return;

    final updatedExercise = Exercise(
        id: widget.id,
        name: widget.name,
        amount: currentAmount - widget.removeAmount,
        removeAmount: widget.removeAmount);

    await DatabaseHelper.instance.update(updatedExercise);

    if (mounted) {
      setState(() {
        currentAmount = updatedExercise.amount;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            '¡10 reps removed from ${widget.name}!',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Color(0xff1C2633),
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

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
                          "$currentAmount",
                          overflow: TextOverflow.fade,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: decreaseRepAmount,
                      label: Text(
                        "${widget.removeAmount}",
                        style: TextStyle(color: Colors.white),
                      ),
                      icon: Icon(
                        Icons.remove,
                        color: Colors.white,
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        minimumSize: Size.square(36),
                        maximumSize: Size(85, 36),
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

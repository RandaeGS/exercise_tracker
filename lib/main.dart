import 'package:exercise_tracker/database_helper.dart';
import 'package:exercise_tracker/exercise_item.dart';
import 'package:flutter/material.dart';

import 'exercise_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white12,
        appBarTheme: AppBarTheme(),
        textTheme: TextTheme(),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Exercise Tracker'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Exercise> exercises = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadExercises();
  }

  Future<void> loadExercises() async {
    final loadedExercises = await DatabaseHelper.instance.getAllExercises();
    setState(() {
      exercises = loadedExercises;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        backgroundColor: Color(0xff1C2633),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 8.0),
            child: ElevatedButton.icon(
              onPressed: () => {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff111827),
              ),
              label: const Text(
                'Add 10',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              icon: const Icon(Icons.add, color: Colors.white),
            ),
          )
        ],
      ),
      body: Container(
        color: Color(0xff111827),
        child: ListView.builder(
          itemCount: exercises.length,
          itemBuilder: (context, index) {
            final exercise = exercises[index];
            return ExerciseItem(
              id: exercise.id,
              name: exercise.name,
              amount: exercise.amount,
              removeAmount: exercise.removeAmount,
            );
          },
        ),
      ),
    );
  }
}

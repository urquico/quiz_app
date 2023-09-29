import 'package:flutter/material.dart';
import 'package:quiz_app/choices.dart';
import 'package:quiz_app/questions.dart';
import 'package:http/http.dart' as http;

class StartGame extends StatefulWidget {
  final String category;

  const StartGame({Key? key, required this.category}) : super(key: key);

  @override
  State<StartGame> createState() => _StartGameState(category: category);
}

class _StartGameState extends State<StartGame> {
  final String category;

  _StartGameState({required this.category});

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category),
      ),
      // Add content inside the body
    );
  }
}

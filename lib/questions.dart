import 'package:flutter/material.dart';

class Questions extends StatelessWidget {
  const Questions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return const Text(
    //   'What is the capital of France?',
    //   style: TextStyle(
    //     fontSize: 30,
    //     fontWeight: FontWeight.bold,
    //     color: Colors.white,
    //   ),
    // );
    return const Text(
      'Paris',
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Choices extends StatelessWidget {
  const Choices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return const Column(
    //   children: [
    //     Text(
    //       'Paris',
    //       style: TextStyle(
    //         fontSize: 30,
    //         fontWeight: FontWeight.bold,
    //         color: Colors.white,
    //       ),
    //     ),
    //     // Add more widgets here if needed
    //   ],
    // );
    // return a text widget
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

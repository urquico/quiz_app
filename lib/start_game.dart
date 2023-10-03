import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math';

class StartGame extends StatefulWidget {
  final String category;
  final int categoryId;

  const StartGame({Key? key, required this.category, required this.categoryId})
      : super(key: key);

  @override
  State<StartGame> createState() =>
      // ignore: no_logic_in_create_state
      _StartGameState(category: category, categoryId: categoryId);
}

class _StartGameState extends State<StartGame> {
  final String category;
  final int categoryId;
  bool showScore = false;
  int score = 0;
  Map<String, dynamic> quizData = {};
  List<dynamic> selectedAnswers =
      List.filled(10, -1); // Assuming there are 10 questions
  // List<dynamic> correctAnswers =
  //     List.generate(10, (index) => Random().nextInt(4));

  _StartGameState({required this.category, required this.categoryId});

  @override
  void initState() {
    fetchCategories(categoryId: categoryId.toString());
    super.initState();
  }

  Future<void> fetchCategories({required String categoryId}) async {
    final url = Uri.parse(
        'https://opentdb.com/api.php?amount=10&category=$categoryId&difficulty=medium&type=multiple');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      setState(() {
        quizData = jsonDecode(response.body);
      });
    } else {
      print(response);
    }
  }

  int countThrees(List<dynamic> numbers) {
    int count = 0;

    for (int number in numbers) {
      if (number == 3) {
        count++;
      }
    }

    return count;
  }

  String decodeHtmlEntities(String input) {
    final StringBuffer output = StringBuffer();
    int i = 0;

    while (i < input.length) {
      if (input.startsWith('&quot;', i)) {
        output.write('"');
        i += 6; // Move past '&quot;'
      } else if (input.startsWith('&ldquo;', i)) {
        output.write('“'); // Left double quotation mark
        i += 7; // Move past '&ldquo;'
      } else if (input.startsWith('&#039;', i)) {
        output.write("'");
        i += 6; // Move past '&#039;'
      } else {
        // Copy the character as is
        output.write(input[i]);
        i++;
      }
    }

    return output.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(category),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(
              top: 10,
              left: 30,
              right: 30,
            ),
            child: Column(
              children: [
                GFAlert(
                  title: 'Welcome to $category Quiz!',
                  content: "Answer the following 10 questions",
                  type: GFAlertType.rounded,
                ),
                const SizedBox(height: 20),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: quizData.containsKey('results')
                      ? quizData['results'].length
                      : 0,
                  itemBuilder: (context, index) {
                    if (quizData.containsKey('results') == true) {
                      return Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              decodeHtmlEntities(
                                  quizData['results'][index]['question']),
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'DM Sans',
                                color: Colors.blueGrey,
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: quizData['results'][index]
                                        ['incorrect_answers']
                                    .length +
                                1,
                            itemBuilder: (context, choiceIndex) {
                              return GFCheckboxListTile(
                                title: Text(
                                  choiceIndex == 3
                                      ? decodeHtmlEntities(quizData['results']
                                          [index]['correct_answer'])
                                      : decodeHtmlEntities(quizData['results']
                                              [index]['incorrect_answers']
                                          [choiceIndex]),
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'DM Sans',
                                    color: Colors.blueGrey,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                                value: selectedAnswers[index] == choiceIndex,
                                onChanged: (value) {
                                  setState(() {
                                    selectedAnswers[index] = choiceIndex;
                                  });
                                },
                                activeBgColor: Colors.deepPurple,
                                inactiveBorderColor: Colors.deepPurple,
                                activeBorderColor: Colors.deepPurple,
                              );
                            },
                          ),
                          const SizedBox(height: 20),
                        ],
                      );
                    } else {
                      // Handle the case when quizData is null or does not contain 'results'
                      return const Text('No quiz data available');
                    }
                  },
                ),
                Container(
                    child: showScore
                        ? GFAlert(
                            content: 'Your score is $score / 10',
                            type: GFAlertType.rounded,
                          )
                        : null),
                const SizedBox(height: 20),
                GFButton(
                  onPressed: () {
                    setState(() {
                      showScore = true;
                      score = countThrees(selectedAnswers);
                    });
                  },
                  text: 'Submit',
                  fullWidthButton: true,
                ),
              ],
            ),
          ),
        )
        // Add content inside the body
        );
  }
}

import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

import 'package:quiz_app/start_game.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool showBtn = false;

  List<Map<String, dynamic>> categories = [
    {
      'category': 'General Knowledge',
      'categoryId': 9,
      'description':
          'General Knowledge questions and answers with explanation for interview, competitive examination and entrance test. Fully solved examples with detailed answer description, explanation are given and it would be easy to understand.',
    },
    {
      'category': 'Books',
      'categoryId': 10,
      'description':
          'Books and Authors questions and answers with explanation for interview, competitive examination and entrance test. Fully solved examples with detailed answer description, explanation are given and it would be easy to understand.',
    },
    {
      'category': 'Films',
      'categoryId': 11,
      'description':
          'Film questions and answers with explanation for interview, competitive examination and entrance test. Fully solved examples with detailed answer description, explanation are given and it would be easy to understand.',
    },
    {
      'category': 'Music',
      'categoryId': 12,
      'description':
          'Music questions and answers with explanation for interview, competitive examination and entrance test. Fully solved examples with detailed answer description, explanation are given and it would be easy to understand.',
    },
    {
      'category': 'Musical & Theatres',
      'categoryId': 13,
      'description':
          "Musical & Theatres questions and answers with explanation for interview, competitive examination and entrance test. Fully solved examples with detailed answer description, explanation are given and it would be easy to understand.",
    },
    {
      'category': 'Television',
      'categoryId': 14,
      'description':
          'Television questions and answers with explanation for interview, competitive examination and entrance test. Fully solved examples with detailed answer description, explanation are given and it would be easy to understand.',
    },
    {
      'category': 'Video Games',
      'categoryId': 15,
      'description':
          'Video Games questions and answers with explanation for interview, competitive examination and entrance test. Fully solved examples with detailed answer description, explanation are given and it would be easy to understand.',
    },
    {
      'category': 'Board Games',
      'categoryId': 16,
      'description':
          'Board Games questions and answers with explanation for interview, competitive examination and entrance test. Fully solved examples with detailed answer description, explanation are given and it would be easy to understand.',
    },
    {
      'category': 'Science & Nature',
      'categoryId': 17,
      'description':
          'Science & Nature questions and answers with explanation for interview, competitive examination and entrance test. Fully solved examples with detailed answer description, explanation are given and it would be easy to understand.',
    },
    {
      'category': 'Computer',
      'categoryId': 18,
      'description':
          'Computer questions and answers with explanation for interview, competitive examination and entrance test. Fully solved examples with detailed answer description, explanation are given and it would be easy to understand.'
    },
    {
      'category': 'Mathematics',
      'categoryId': 19,
      'description':
          'Mathematics questions and answers with explanation for interview, competitive examination and entrance test. Fully solved examples with detailed answer description, explanation are given and it would be easy to understand.'
    },
    {
      'category': 'Mythology',
      'categoryId': 20,
      'description':
          'Mythology questions and answers with explanation for interview, competitive examination and entrance test. Fully solved examples with detailed answer description, explanation are given and it would be easy to understand.'
    },
    {
      'category': 'Sports',
      'categoryId': 21,
      'description':
          'Sports questions and answers with explanation for interview, competitive examination and entrance test. Fully solved examples with detailed answer description, explanation are given and it would be easy to understand.'
    },
    {
      'category': 'Geography',
      'categoryId': 22,
      'description':
          'Geography questions and answers with explanation for interview, competitive examination and entrance test. Fully solved examples with detailed answer description, explanation are given and it would be easy to understand.'
    },
    {
      'category': 'History',
      'categoryId': 23,
      'description':
          'History questions and answers with explanation for interview, competitive examination and entrance test. Fully solved examples with detailed answer description, explanation are given and it would be easy to understand.'
    },
    {
      'category': 'Politics',
      'categoryId': 24,
      'description':
          'Politics questions and answers with explanation for interview, competitive examination and entrance test. Fully solved examples with detailed answer description, explanation are given and it would be easy to understand.'
    },
    {
      'category': 'Celebrities',
      'categoryId': 26,
      'description':
          'Celebrities questions and answers with explanation for interview, competitive examination and entrance test. Fully solved examples with detailed answer description, explanation are given and it would be easy to understand.'
    },
    {
      'category': 'Animals',
      'categoryId': 27,
      'description':
          'Animals questions and answers with explanation for interview, competitive examination and entrance test. Fully solved examples with detailed answer description, explanation are given and it would be easy to understand.'
    },
    {
      'category': 'Vehicles',
      'categoryId': 28,
      'description':
          'Vehicles questions and answers with explanation for interview, competitive examination and entrance test. Fully solved examples with detailed answer description, explanation are given and it would be easy to understand.'
    },
    {
      'category': 'Comics',
      'categoryId': 29,
      'description':
          'Comics questions and answers with explanation for interview, competitive examination and entrance test. Fully solved examples with detailed answer description, explanation are given and it would be easy to understand.'
    },
    {
      'category': "Japan's Anime & Manga",
      'categoryId': 31,
      'description':
          'Anime and Manga questions and answers with explanation for interview, competitive examination and entrance test. Fully solved examples with detailed answer description, explanation are given and it would be easy to understand.'
    },
    {
      'category': "Cartoon & Animations",
      'categoryId': 32,
      'description':
          'Cartoon and Animations question and answers with explanation for interview, competitive examination and entrance test. Fully solved examples with detailed answer description, explanation are given and it would be easy to understand.'
    },
  ];

  @override
  void initState() {
    // fetchCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Container(
          padding: const EdgeInsets.only(
            left: 10,
          ),
          child: const Text(
            'Home',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        // make transparent
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Container(
          // blue gradient accent background color
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF3550DC),
                Color(0xFF27E9F7),
              ],
            ),
          ),

          padding: const EdgeInsets.only(
            top: 80,
            left: 30,
            right: 30,
          ),
          child: Column(
            children: [
              // add a column widget
              Column(
                // add a crossAxisAlignment property
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // add a Text widget
                  const Text(
                    'Hello, User',
                    style: TextStyle(
                      fontSize: 14,
                      // fontWeight not bold
                      fontWeight: FontWeight.w400,
                      // set font family to DM Sans
                      fontFamily: 'DM Sans',
                      color: Colors.white,
                      // remove yellow underline
                      decoration: TextDecoration.none,
                      // add padding
                    ),
                  ),
                  const Text(
                    "Let's test your Knowledge",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontFamily: 'DM Sans',
                      color: Colors.white,
                      decoration: TextDecoration.none,
                      // add padding
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const Text(
                    "Choose a Category",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                      fontFamily: 'DM Sans',
                      color: Colors.white,
                      decoration: TextDecoration.none,
                      // add padding
                    ),
                  ),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ListView.builder(
                        shrinkWrap:
                            true, // Use shrinkWrap to allow the ListView to take only the space it needs
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            child: GFAccordion(
                              titleChild: Column(
                                children: [
                                  Text(
                                    categories[index]['category'],
                                    textAlign: TextAlign.start,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      fontFamily: 'DM Sans',
                                      color: Colors.black,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                  const Text(
                                    "10 Questions",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'DM Sans',
                                      color: Colors.black,
                                      decoration: TextDecoration.none,
                                    ),
                                  )
                                ],
                              ),
                              contentChild: Column(
                                children: [
                                  Text(
                                    categories[index]['description'],
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'DM Sans',
                                      color: Colors.black,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                  GFButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => StartGame(
                                            category: categories[index]
                                                ['category'],
                                            categoryId: categories[index]
                                                ['categoryId'],
                                          ),
                                        ),
                                      );
                                    },
                                    text: 'Start Quiz',
                                    fullWidthButton: true,
                                    textStyle: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'DM Sans',
                                      color: Colors.white,
                                      decoration: TextDecoration.none,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

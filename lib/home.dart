import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<dynamic> categories = [];
  bool isLoading = true;

  List defaultCategories = ['values', 'movies', 'music', 'sports'];

  @override
  void initState() {
    super.initState();
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    final response =
        await http.get(Uri.parse('https://the-trivia-api.com/v2/tags'));

    if (response.statusCode == 200) {
      // Successful response, parse and handle the data here
      setState(() {
        categories = json.decode(response.body);
        isLoading = false;
      });
    } else {
      // Handle errors, such as network issues or server errors
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    print(categories.isEmpty);

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
                  SizedBox(
                    height: 50,
                  ),
                  const Center(
                    child: Text(
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
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      if (categories.isEmpty)
                        const Column(
                          children: [
                            SizedBox(
                              height: 50,
                            ),
                            Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        )
                      else
                        ListView.builder(
                          shrinkWrap:
                              true, // Use shrinkWrap to allow the ListView to take only the space it needs
                          itemCount: categories.length,
                          itemBuilder: (context, index) {
                            return Container(
                              height: 50,
                              color: Colors.amber[600],
                              child: Center(
                                child: Text(categories[index]),
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

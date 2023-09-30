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
  bool showBtn = false;

  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    fetchCategories();
    scrollController.addListener(() {
      //scroll listener
      double showoffset =
          10.0; //Back to top botton will show on scroll offset 10.0

      if (scrollController.offset > showoffset) {
        showBtn = true;
        setState(() {
          //update state
        });
      } else {
        showBtn = false;
        setState(() {
          //update state
        });
      }
    });
    super.initState();
  }

  Future<void> fetchCategories() async {
    final response =
        await http.get(Uri.parse('https://the-trivia-api.com/v2/tags'));

    if (response.statusCode == 200) {
      final List newCategories = json.decode(response.body);
      // Successful response, parse and handle the data here
      setState(() {
        categories = newCategories.map<String>((category) {
          final categoryName = category;
          return "$categoryName";
        }).toList();
      });
    } else {
      print(response);
    }
  }

  @override
  Widget build(BuildContext context) {
    print(categories.isEmpty);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      floatingActionButton: FloatingActionButton.small(
        onPressed: () {
          scrollController.animateTo(
              //go to top of scroll
              0, //scroll offset to go
              duration: Duration(milliseconds: 500), //duration of scroll
              curve: Curves.fastOutSlowIn //scroll type
              );
        },
        tooltip: 'Back to top',
        child: const Icon(Icons.arrow_upward),
      ),
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
        controller: scrollController,
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
                        RefreshIndicator(
                            onRefresh: fetchCategories,
                            child: ListView.builder(
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
                            ))
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

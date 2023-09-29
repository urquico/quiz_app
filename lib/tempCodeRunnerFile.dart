import 'package:http/http.dart' as http;

Future<void> fetchCategories() async {
  final response = await http.get(Uri.parse('https://api.example.com/data'));

  if (response.statusCode == 200) {
    // Successful response, parse and handle the data here
    print('Response data: ${response.body}');
  } else {
    // Handle errors, such as network issues or server errors
    print('Error: ${response.statusCode}');
  }
}

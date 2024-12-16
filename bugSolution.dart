```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>?> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Check if the response body is valid JSON before decoding
      if (response.body.isNotEmpty) {
        try {
          final jsonData = jsonDecode(response.body);
          if (jsonData is Map<String, dynamic>) {
              return jsonData; //Return JSON data safely
          } else {
            print('Error: Invalid JSON structure. Expected Map, got ${jsonData.runtimeType}');
            return null; // Or throw an exception
          }
        } catch (e) {
          print('Error decoding JSON: $e');
          return null; // Or throw an exception
        }
      } else {
        print('Error: Empty response body');
        return null; // Or throw an exception
      }
    } else {
      print('Error: HTTP request failed with status code ${response.statusCode}');
      return null; // Or throw an exception
    }
  } catch (e) {
    print('Error: $e');
    return null; // Or throw an exception
  }
}
```
```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Incorrectly assuming the response body is a JSON string.
      final data = jsonDecode(response.body); // This could throw an exception
      // ... process the data
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    // Exception handling is good, but might need improvement
    print('Error: $e');
  }
}
```
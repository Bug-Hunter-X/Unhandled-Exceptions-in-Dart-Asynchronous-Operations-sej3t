```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      // Process jsonData - Add proper error handling here if JSON decoding fails
      // Example: 
try {
        //Your code here
      } catch(e) {
        print("Error decoding JSON: $e");
        rethrow;
      }
    } else {
      throw Exception('Failed to load data. Status code: ${response.statusCode}');
    }
  } on FormatException catch (e) {
    // Handle JSON format exceptions
    print('Invalid JSON format: $e');
    rethrow; 
  } catch (e) {
    print('Error: $e');
    rethrow;
  }
}

void main() async {
  try {
    await fetchData();
    print('Data fetched successfully');
  } on Exception catch (e) {
    print('An error occurred: $e');
  } catch (e) {
    print('An unexpected error occurred: $e');
  }
}
```
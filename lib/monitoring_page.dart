import 'package:http/http.dart' as http;

Future<void> fetchSystemHealth() async {
  final response =
      await http.get(Uri.parse('https://your-api-endpoint/system-health'));
  if (response.statusCode == 200) {
  } else {
    print("Error");
  }
}

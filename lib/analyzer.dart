import 'package:http/http.dart' as http;

Future<void> fetchLogAnalysis() async {
  final response =
      await http.get(Uri.parse('https://your-api-endpoint/log-analysis'));
  if (response.statusCode == 200) {
  } else {
    print('Error');
  }
}

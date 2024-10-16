import 'package:http/http.dart' as http;

Future<void> fetchCICDStatus() async {
  final response =
      await http.get(Uri.parse('https://your-api-endpoint/cicd-status'));
  if (response.statusCode == 200) {
  } else {
    print('Error');
  }
}

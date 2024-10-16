import 'package:http/http.dart' as http;

Future<void> fetchK8sData() async {
  final response = await http.get(Uri.parse('https://your-api-endpoint/k8s-status'));
  if (response.statusCode == 200) {
    // Parse and display Kubernetes data
  } else {
    // Handle error
  }
}

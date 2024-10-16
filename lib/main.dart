import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Accuknox Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Accuknox Dashboard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DashboardButton(
              title: 'Kubernetes Deployment',
              description: 'Monitor your Kubernetes deployments.',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => KubernetesPage()),
                );
              },
            ),
            DashboardButton(
              title: 'CI/CD Pipeline Status',
              description: 'View your CI/CD build and deployment status.',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CICDPage()),
                );
              },
            ),
            DashboardButton(
              title: 'System Monitoring',
              description: 'Check system health (CPU, Memory, Disk).',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SystemMonitoringPage()),
                );
              },
            ),
            DashboardButton(
              title: 'Log Analyzer',
              description: 'Analyze web server logs for patterns.',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LogAnalyzerPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class DashboardButton extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback onPressed;

  DashboardButton({
    required this.title,
    required this.description,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(description),
        trailing: ElevatedButton(
          onPressed: onPressed,
          child: const Text('Go'),
        ),
      ),
    );
  }
}

class KubernetesPage extends StatefulWidget {
  @override
  _KubernetesPageState createState() => _KubernetesPageState();
}

class _KubernetesPageState extends State<KubernetesPage> {
  String deploymentStatus = 'Fetching deployment status...';

  @override
  void initState() {
    super.initState();
    fetchKubernetesStatus();
  }

  Future<void> fetchKubernetesStatus() async {
    final response = await http
        .get(Uri.parse('https://your-api-endpoint/kubernetes/status'));

    if (response.statusCode == 200) {
      setState(() {
        deploymentStatus = jsonDecode(response.body)['status'];
      });
    } else {
      setState(() {
        deploymentStatus = 'Failed to load status: ${response.statusCode}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kubernetes Deployment'),
      ),
      body: Center(
        child: Text(deploymentStatus),
      ),
    );
  }
}

class CICDPage extends StatefulWidget {
  @override
  _CICDPageState createState() => _CICDPageState();
}

class _CICDPageState extends State<CICDPage> {
  String cicdStatus = 'Fetching CI/CD pipeline status...';

  @override
  void initState() {
    super.initState();
    fetchCICDStatus();
  }

  Future<void> fetchCICDStatus() async {
    final response =
        await http.get(Uri.parse('https://your-api-endpoint/cicd/status'));

    if (response.statusCode == 200) {
      setState(() {
        cicdStatus = jsonDecode(response.body)['status'];
      });
    } else {
      setState(() {
        cicdStatus = 'Failed to load CI/CD status: ${response.statusCode}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CI/CD Pipeline Status'),
      ),
      body: Center(
        child: Text(cicdStatus),
      ),
    );
  }
}

class SystemMonitoringPage extends StatefulWidget {
  @override
  _SystemMonitoringPageState createState() => _SystemMonitoringPageState();
}

class _SystemMonitoringPageState extends State<SystemMonitoringPage> {
  String systemHealth = 'Fetching system health...';

  @override
  void initState() {
    super.initState();
    fetchSystemHealth();
  }

  Future<void> fetchSystemHealth() async {
    final response =
        await http.get(Uri.parse('https://your-api-endpoint/system-health'));

    if (response.statusCode == 200) {
      setState(() {
        systemHealth = jsonDecode(response.body)['health'];
      });
    } else {
      setState(() {
        systemHealth = 'Failed to load system health: ${response.statusCode}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('System Monitoring'),
      ),
      body: Center(
        child: Text(systemHealth),
      ),
    );
  }
}

class LogAnalyzerPage extends StatefulWidget {
  @override
  _LogAnalyzerPageState createState() => _LogAnalyzerPageState();
}

class _LogAnalyzerPageState extends State<LogAnalyzerPage> {
  String logAnalysis = 'Fetching log analysis...';

  @override
  void initState() {
    super.initState();
    fetchLogAnalysis();
  }

  Future<void> fetchLogAnalysis() async {
    final response =
        await http.get(Uri.parse('https://your-api-endpoint/logs/analyze'));

    if (response.statusCode == 200) {
      setState(() {
        logAnalysis = jsonDecode(response.body)['analysis'];
      });
    } else {
      setState(() {
        logAnalysis = 'Failed to load log analysis: ${response.statusCode}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log Analyzer'),
      ),
      body: Center(
        child: Text(logAnalysis),
      ),
    );
  }
}

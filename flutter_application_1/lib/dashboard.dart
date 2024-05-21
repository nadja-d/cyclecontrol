import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
// Import for Android features.
import 'package:webview_flutter_android/webview_flutter_android.dart';
// Import for iOS features.
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Center(
        child: Container(
          width: 600,
          height: 450,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
          ),
          child: Text("Halo")
        ),
      ),
    );
  }
}

// void main() {
//   runApp(MaterialApp(
//     home: dashboard(),
//   ));
// }

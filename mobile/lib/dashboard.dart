import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class dashboard extends StatelessWidget {
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
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: WebView(
                initialUrl:
                    'https://lookerstudio.google.com/embed/reporting/5945c858-859d-4b56-bebf-dc45d2204c34/page/yanuD',
                javascriptMode: JavascriptMode.unrestricted,
                gestureNavigationEnabled: true,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: dashboard(),
  ));
}

// import 'package:flutter/material.dart';
// import 'login.dart'; // Import login.dart

// void main() {
//   runApp(landingpage());
// }

// class landingpage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//               colors: [Color(0xFF59A9F2), Color(0xFFBEE0FF)],
//             ),
//           ),
//           child: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Image.asset(
//                   'assets/CC_Logo.png',
//                   width: 120, // Adjust the width as needed
//                   height: 120, // Adjust the height as needed
//                 ),
//                 SizedBox(height: 20),
//                 Text(
//                   'CycleControl',
//                   style: TextStyle(
//                     fontSize: 32,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 ElevatedButton(
//                   onPressed: () {
//                     // Navigate to the login page
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => LoginPage()),
//                     );
//                   },
//                   child: Text('Get Started'),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.white,
//                     padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
//                     textStyle: TextStyle(fontSize: 18, color: Colors.white),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_application_1/LoginPage.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: LandingPage(),
//     );
//   }
// }

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    super.initState();
    // Auto navigate to login page after 2.5 seconds
    Future.delayed(Duration(seconds: 2, milliseconds: 500), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF59A9F2), Color(0xFFBEE0FF)],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/CC_Logo.png',
                width: 120, // Adjust the width as needed
                height: 120, // Adjust the height as needed
              ),
              SizedBox(height: 20),
              Text(
                'CycleControl',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              // SizedBox(height: 20),
              // ElevatedButton(
              //   onPressed: () {
              //     // Navigate to the login page
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(builder: (context) => login()),
              //     );
              //   },
              //   child: Text('Get Started'),
              //   style: ElevatedButton.styleFrom(
              //     backgroundColor: Colors.white,
              //     padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              //     textStyle: TextStyle(fontSize: 18, color: Colors.white),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

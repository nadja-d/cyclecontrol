import 'package:flutter/material.dart';
import 'dashboard.dart'; // Import login.dart

class login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Gradient
          Positioned.fill(
            child: FractionallySizedBox(
              alignment: Alignment.bottomCenter,
              heightFactor: 0.45, // 40% of the screen height
              child: Container(
                decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFF59A9F2), Color(0xFFBEE0FF)], // Adjusted gradient colors
                ),
                ),
              ),
            ),
          ),
          // Background image
          Positioned.fill(
            child: FractionallySizedBox(
              alignment: Alignment.topCenter,
              heightFactor: 0.55, // 60% of the screen height
              child: Image.asset(
                'assets/Login_Background.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 20,
            left: 20,
            child: Image.asset(
              'assets/CC_Logo.png',
              width: 65,
              height: 65,
            ),
          ),
          // Username section
          Positioned(
            left: 20,
            right: 20,
            bottom: MediaQuery.of(context).size.height * 0.33,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Username',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Icon(Icons.person, color: Colors.grey),
                      ),
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter your username',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Password section
          Positioned(
            left: 20,
            right: 20,
            bottom: MediaQuery.of(context).size.height * 0.22,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Password',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Icon(Icons.lock, color: Colors.grey),
                      ),
                      Expanded(
                        child: TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter your password',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Forgot password
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.18,
            right: 20,
            child: Text(
              'Forgot Password',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Login button
          Positioned(
            left: 20,
            right: 20,
            bottom: 100,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF59A9F2), Color(0xFFBEE0FF)], // Adjusted gradient colors
                ),
                borderRadius: BorderRadius.circular(5), // Set border radius to 5
              ),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => dashboard()),
                  );                },
                child: Text(
                  'Log In',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF59A9F2), // Set transparent background color for ElevatedButton
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5), // Set border radius to 5
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: login(),
  ));
}


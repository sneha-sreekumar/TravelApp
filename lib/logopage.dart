import 'package:flutter/material.dart';
import 'loginpage.dart';

class LogoPage extends StatefulWidget {
  const LogoPage({super.key});

  @override
  State<LogoPage> createState() => _LogoPageState();
}

class _LogoPageState extends State<LogoPage> {
  @override
  void initState() {
    super.initState();
    // Delay navigation for 3 seconds
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginPagee()),
      );
    }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Gradient Background
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.blue[300]!,
                  Colors.blue[900]!,
                ],
              ),
            ),
          ),

          // Page label at the top left
          Positioned(
            top: 10,
            left: 10,
            child: Text(
              "Intro Page 1",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // Centered logo and text
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Replace with your logo image
                Image.asset(
                  'assets/image/logo.png',  // Add your logo image path
                  width: 200,
                  height: 200,

                ),
                const SizedBox(height: 20),
                Text(
                  "GLOBETRAILS",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "YOUR JOURNEY YOUR STORY",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:responsi_app/main.dart';// Make sure to import your main app page

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Start a timer to navigate to the next page after a few seconds
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginPage()), // Replace with your home page
      );
    });

    return Scaffold(
      backgroundColor: Colors.white, // Set your splash screen background color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.png', // Replace with your logo or image asset
              height: 100.0, // Adjust the height as needed
            ),
          ],
        ),
      ),
    );
  }
}

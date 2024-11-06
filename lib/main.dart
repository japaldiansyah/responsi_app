import 'package:flutter/material.dart';
import 'package:responsi_app/home_page.dart';
import 'package:responsi_app/lupa_password_page.dart';
import 'package:responsi_app/splash_screen.dart';
import 'daftar_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}

final List<User> users = []; // In-memory storage for registered users

class User {
  final String email;
  final String password;

  User(this.email, this.password);
}


class LoginPage extends StatelessWidget {
  const LoginPage({super.key}); // Marked as const since it has no mutable state

  @override
  Widget build(BuildContext context) {
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView( // Wrap body in a SingleChildScrollView
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            // Image for logo
            Image.asset("assets/logo.png"),
            const SizedBox(height: 16.0),

            // Text for login title
            const Text(
              'Masuk',
              style: TextStyle(
                fontSize: 24.0,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 16.0),

            // Text for email input
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Masukan Email',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 8.0),

            // TextField for Email
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: const BorderSide(color: Colors.blue, width: 1.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: const BorderSide(color: Colors.blue, width: 1.0),
                ),
              ),
            ),
            const SizedBox(height: 16.0),

            // Text for password input
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Masukan Password',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 8.0),

            // TextField for Password
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: const BorderSide(color: Colors.blue, width: 1.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: const BorderSide(color: Colors.blue, width: 1.0),
                ),
              ),
              obscureText: true, // To hide password input
            ),
            const SizedBox(height: 20.0),

            // Row for "Belum Punya Akun?" and "Lupa Password?"
            Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Aligns text to the left
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Belum Punya Akun?',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // Handle forgot password action
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const LupaPasswordPage()),
                        );
                      },
                      child: const Text(
                        'Lupa Password?',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4.0,),

              // TextButton for "Daftar"
                TextButton(
                  onPressed: () {
                    // Handle "Daftar" action
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const DaftarPage()),
                    );
                  },
                  child: const Text(
                    'Daftar',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0,),
          

            // Login Button
            ElevatedButton(
              onPressed: () {
                // Handle login action
                String username = usernameController.text;
                String password = passwordController.text;

                if (username.isEmpty || password.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Please enter both username and password")),
                  );
                } else if (users.any((user) => user.email == username && user.password == password)) {
                  // Simulate successful login
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Invalid username or password")),
                  );
                }
                  print('username: $username');
                  print('password: $password');
                },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
              child: const Text('Masuk'),
            ),
          ],
        ),
      ),
    );
  }
}

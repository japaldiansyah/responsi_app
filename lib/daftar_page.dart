import 'package:flutter/material.dart';
import 'package:responsi_app/main.dart';

class DaftarPage extends StatelessWidget {
  const DaftarPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController passwordKembaliController = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView( // Wrap the body in a SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center, // Aligns text to the left
            children: [
              Image.asset("assets/logo.png"),
              const SizedBox(height: 16.0),

              // Text for registration title
              const Text(
                'Daftar',
                style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 16.0),

              // Name TextField
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

              TextField(
                controller: emailController,
                decoration: InputDecoration(
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
                  labelText: 'Email',
                ),
              ),
              const SizedBox(height: 16.0),

              // Password TextField
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

              TextField(
                controller: passwordController,
                obscureText: true, // To hide password input
                decoration: InputDecoration(
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
                  labelText: 'Password',
                ),
              ),
              const SizedBox(height: 16.0),

              // Confirm Password TextField
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Masukan Kembali Password',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 8.0),

              TextField(
                controller: passwordKembaliController,
                obscureText: true, // To hide password input
                decoration: InputDecoration(
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
                  labelText: 'Confirm Password',
                ),
              ),
              const SizedBox(height: 20.0), // Add some space below the last TextField

              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Sudah Memiliki akun?',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 8.0),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextButton(
                    onPressed: () {
                        // Handle "Daftar" action
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginPage()),
                      );
                    },
                    child: const Text(
                      'Masuk',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 8.0),

              ElevatedButton(
                onPressed: () {
                  // Handle login action
                  String email = emailController.text;
                  String password = passwordController.text;
                  String confirmPassword = passwordKembaliController.text;

                  if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Please fill in all fields")),
                  );
                } else if (password != confirmPassword) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Passwords do not match")),
                  );
                } else if (users.any((user) => user.email == email)) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Email already registered")),
                  );
                } else {
                  // Add user to the list
                  users.add(User(email, password));
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Account created successfully")),
                  );

                  // Navigate back to login page
                  Navigator.pop(context);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Daftar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

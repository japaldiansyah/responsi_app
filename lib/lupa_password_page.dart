import 'package:flutter/material.dart';

class LupaPasswordPage extends StatelessWidget {
  const LupaPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView( // Wrap the body in a SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start, // Aligns text to the left
            children: [
              Image.asset("assets/logo.png"),
              const SizedBox(height: 16.0),

              // Text for registration title
              const Text(
                'Lupa Password',
                style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 16.0),

              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Pesan',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  
                  SizedBox(height: 8.00,),

                  Text(
                    'Masukan email anda dan tunggu kode',
                  ),
                  Text(
                    'etik akan dikirimkan.',
                  ),

                ],
              ),

              const SizedBox(height: 20.0),

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

          
              const SizedBox(height: 20.0), // Add some space below the last TextField

              

              ElevatedButton(
                onPressed: () {
                  // Handle login action
                  String username = emailController.text;

                  if (username.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Please enter your email"),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('kode telah dikirm'),
                        )
                    );

                    Future.delayed(const Duration(seconds: 2), (){
                      Navigator.pop(context);
                      
                    });

                    print('username: $username');

                  }    
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Kirim'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

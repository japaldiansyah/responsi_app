import 'package:flutter/material.dart';

class EditAkunPage extends StatefulWidget {
  final String initialName; // Field to hold the initial name

  const EditAkunPage({super.key, required this.initialName}); // Make it required
  

  @override
  EditAkunPageState createState() => EditAkunPageState();
}

class EditAkunPageState extends State<EditAkunPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  // Placeholder for image path
  String imagePath = 'assets/han_so_hee.jpg';
  

  @override
  void initState() {
    super.initState();
    // Initialize the name controller with the initial value passed from ProfilePage
    nameController.text = widget.initialName; // Set initial value to the controller
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Akun'),
      ),
      body: SingleChildScrollView( // Wrap the content in a SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 30.0),
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/han_so_hee.jpg'),
              ),
              const SizedBox(height: 20),
              Text(
                nameController.text.isEmpty ? 'No Name' : nameController.text, // Displaying the name dynamically
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: emailController,
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
              const SizedBox(height: 5.0,),

              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Nama',
                  border: 
                  OutlineInputBorder(
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
              const SizedBox(height: 5.0,),

              TextFormField(
                controller: phoneController,
                decoration: InputDecoration(labelText: 'Nomor Telepon',
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
                  ),),
              ),
              const SizedBox(height: 5.0,),

              TextFormField(
                controller: addressController,
                decoration: InputDecoration(labelText: 'Alamat',
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
                  ),),
              ),
              const SizedBox(height: 20),
              
              ElevatedButton(
                onPressed: () {
                  // Navigate back and pass the updated values
                  Navigator.pop(context, {
                    'name': nameController.text.isEmpty ? 'No Name' : nameController.text,
                    'address': addressController.text,
                    'phone': phoneController.text,
                    'email': emailController.text,
                  });
                },
                style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                ),

                child: const Text('Ubah Profil'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

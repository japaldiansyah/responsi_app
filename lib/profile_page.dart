// profile_page.dart
import 'package:flutter/material.dart';
import 'package:responsi_app/edit_akun_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  String displayName = 'Han So-hee'; // Default name

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 160.0,
                width: 130.0,
                color: const Color.fromARGB(255, 218, 217, 217),
                child: Column(
                  children: [
                    const SizedBox(height: 10.0,),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(40.0),
                      child: Image.asset(
                        'assets/han_so_hee.jpg',
                        height: 80.0,
                        width: 80.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      displayName, // Use displayName here
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const Text(
                      'Famous Actress',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10.0,),
          ListTile(
            title: const Text('Kelola Akun'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () async {
                // Pass the current displayName to EditAkunPage
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditAkunPage(initialName: displayName), // Pass displayName
                  ),
                );
                if (result != null) {
                  setState(() {
                    displayName = result['name']; // Update the display name with the returned value
                  });
                }
            },
          ),
          ListTile(
            title: const Text('Notification'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              // Handle navigate to notification settings page
            },
          ),
          ListTile(
            title: const Text('Privacy Policy'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              // Handle navigate to privacy settings page
            },
          ),
          ListTile(
            title: const Text('Terms of Service'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              // Handle navigate to terms of service page
            },
          ),
        ],
      ),
    );
  }
}

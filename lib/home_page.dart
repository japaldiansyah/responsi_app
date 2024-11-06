import 'package:flutter/material.dart';
import 'package:responsi_app/main.dart';
import 'package:responsi_app/profile_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bottom Navigation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  // List of widgets to display for each tab
  final List<Widget> _pages = [
    // Custom Home Page Widget
    const HomePageContent(),
    const ProfilePage(),
    const Center(child: Text('Logout')),
  ];  

  void _onItemTapped(int index) {
    if (index == 2) {
      // Handle logout logic here
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    } else {
      setState(() {
        _selectedIndex = index; // Update the selected index
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space the icons evenly
          children: [
            // Left icon
            IconButton(
              icon: const Icon(Icons.person), // Replace with your desired icon
              onPressed: () {
                // Handle left icon tap
                print('User icon tapped');
              },
            ),
            // Right icons
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.notifications), // First right icon
                  onPressed: () {
                    // Handle first right icon tap
                    print('Notification icon tapped');
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.settings), // Second right icon
                  onPressed: () {
                    // Handle second right icon tap
                    print('Settings icon tapped');
                  },
                ),
              ],
            ),
          ],
        ),
      ),

      body: _pages[_selectedIndex], // Display the selected page
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout),
            label: 'Logout',
          ),
        ],
        currentIndex: _selectedIndex, // Set the current index
        selectedItemColor: Colors.black,
        onTap: _onItemTapped, // Handle tap events
      ),
    );
  }
}

// Custom Home Page Widget
class HomePageContent extends StatefulWidget {
  const HomePageContent({super.key});
  

  @override
  _HomePageContentState createState() => _HomePageContentState();
}

class _HomePageContentState extends State<HomePageContent> {
  // State variable to keep track of like status for each item
  final List<bool> _isLiked = List<bool>.filled(10, false);

  @override
  Widget build(BuildContext context) {
     
     final List<String> imagePaths = [
      'assets/han_so_hee.jpg',
      'assets/chaeyoung.jpg',
      'assets/dahyun.jpg',
      'assets/giselle.jpg',
      'assets/go_younjung.jpg',
      'assets/jihyo.jpg',
      'assets/nadin.jpg',
      'assets/nayeon.jpg',
      'assets/ryujin.jpg',
      'assets/zee_jkt48.jpg',
      // Add more image paths as needed
    ];
    final List<String> itemNames = [
      'Han So-hee',
      'Son Chaeyoung',
      'Kim Dahyun',
      'Aeri Uchinaga',
      'Go Youn Jung',
      'Park Jihyo',
      'Nadin Amizah',
      'Im Na-yeon',
      'Shin Ryujin',
      'Azizi Asadel',
    ];
    
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Guest',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),

          //titlr grid view
          const Row(
            mainAxisAlignment: MainAxisAlignment.start, // Align items at the start
            children: [
              Text(
                'Widget Grid View',
                style: TextStyle(
                  fontSize: 24.0,
                ),
              ),
              SizedBox(width: 8.0), // Add some space between the text and the icon
              Icon(
                Icons.arrow_forward, // Use the desired icon here
                size: 24.0, // Set the size of the icon
                color: Colors.black, // Set the color of the icon
              ),
            ],
          ),
          const SizedBox(height: 10),

          //grid view
          SizedBox(
            height: 200,
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 1.5,
              ),
              itemCount: 10,
              itemBuilder:(context, index){
                return Container(
                  color: const Color.fromARGB(255, 218, 217, 217),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Image.asset(
                          imagePaths[index],
                          height: 130,
                          width: 130,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(2.0),
                        child: Align(
                          alignment: Alignment.centerLeft, // Align to the start
                          child: Text(
                            'Artist',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Align(
                          alignment: Alignment.centerLeft, // Align to the start
                          child: Text(
                            itemNames[index],
                            style: const TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                );

              },
            ),
          ),
          const SizedBox(height: 10.0,),

          //title widget list view
          const Row(
            mainAxisAlignment: MainAxisAlignment.start, // Align items at the start
            children: [
              Text(
                'Widget List View',
                style: TextStyle(
                  fontSize: 24.0,
                ),
              ),
              SizedBox(width: 8.0), // Add some space between the text and the icon
              Icon(
                Icons.arrow_forward, // Use the desired icon here
                   size: 24.0, // Set the size of the icon
                   color: Colors.black, // Set the color of the icon
                  ),
                ],
              ),
            const SizedBox(height: 10),   

            //list view
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: SizedBox(
                      height: 60.0, // Set the desired height
                      width: 60.0,  // Set the desired width
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30.0), // Set the desired radius
                        child: Image.asset(
                          imagePaths[index],
                          fit: BoxFit.cover, // This will scale the image to cover the box
                        ),
                      ),  
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start, // Align to the top
                      children: [
                        Text(
                          itemNames[index],
                          style: const TextStyle(color: Colors.black),
                        ),
                        const SizedBox(height: 1.0), // Optional space between title and subtitle
                        const Text(
                          'Famous Artist',
                          style: TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(height: 5.0), // Space before the like icon
                        
                        Row(
                          children: [
                            GestureDetector(
                              onTap: (){  
                                setState((){ 
                                   _isLiked[index] = !_isLiked[index];
                                });
                              },
                              child: Icon(
                                _isLiked[index] ? Icons.favorite : Icons.favorite_border,
                                color: _isLiked[index] ? Colors.red : Colors.grey,
                                size: 20.0, // Icon size
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Tapped on artist ${itemNames[index]}'),
                        ),
                      );
                    },
                  );
                },
              ),
            ),  
          
        ],
      ),
    );
  }
}


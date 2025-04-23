import 'package:flutter/material.dart';
import 'package:globetrails/uploadblogpage.dart';

import 'addtravelspotpage.dart';
import 'createtravelplan.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ProfilePagee(),
  ));
}

class ProfilePagee extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top Section with Background Image, Profile Photo, and Menu
            Stack(
              alignment: Alignment.center,
              children: [
                // Background Image
                Container(
                  height: 250,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/image/mountains.jpg'), // Background image
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                // Profile Picture
                Positioned(
                  top: 180,
                  child: CircleAvatar(
                    radius: 55,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/image/profile.jpg'), // Profile image
                    ),
                  ),
                ),

                // Three-dot menu
                Positioned(
                  top: 40,
                  right: 20,
                  child: PopupMenuButton<String>(
                    onSelected: (value) {
                      if (value == 'Upload Blog') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => UploadBlogPagee()),
                        );
                      } else if (value == 'Add Travel Spot') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AddTravelSpotPage()),
                        );
                      } else if (value == 'Create Travel Plan') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CreateTravelPlanPage()),
                        );
                      }
                    },
                    itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                      const PopupMenuItem<String>(
                        value: 'Upload Blog',
                        child: Text('Upload Blog'),
                      ),
                      const PopupMenuItem<String>(
                        value: 'Add Travel Spot',
                        child: Text('Add Travel Spot'),
                      ),
                      const PopupMenuItem<String>(
                        value: 'Create Travel Plan',
                        child: Text('Create Travel Plan'),
                      ),
                    ],
                    icon: const Icon(Icons.more_vert, color: Colors.white),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 60),

            // User Info
            Text(
              "Isabella",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(
              "isab@gmail.com",
              style: TextStyle(color: Colors.grey[600], fontSize: 16),
            ),
            const SizedBox(height: 20),

            // Stats Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildStat("215", "followers"),
                _buildStat("56", "following"),
                _buildStat("2k", "likes"),
              ],
            ),
            const SizedBox(height: 20),

            // Action Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildActionButton("Edit Profile", Colors.blue[700]!),
                const SizedBox(width: 20),
                _buildActionButton("Chat", Colors.blue[700]!),
              ],
            ),
            const SizedBox(height: 30),

            // Photos Grid Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Photos",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  GridView.count(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    children: [
                      _buildPhotoCard('assets/image/eiffel.jpg'),
                      _buildPhotoCard('assets/image/tajmahal.jpg'),
                      _buildPhotoCard('assets/image/mountains.jpg'),
                      _buildPhotoCard('assets/image/beach.jpg'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          ),
        ],
      ),
    );
  }

  // Widget for Stats
  Widget _buildStat(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(
          label,
          style: TextStyle(color: Colors.grey[600]),
        ),
      ],
    );
  }

  // Widget for Buttons
  Widget _buildActionButton(String text, Color color) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      ),
      onPressed: () {},
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }

  // Widget for Photo Card
  Widget _buildPhotoCard(String imagePath) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

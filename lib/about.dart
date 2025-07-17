import 'package:flutter/material.dart';
import 'home.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'ABOUT US',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 1.2,
          ),
        ),
     leading: IconButton(
  icon: Icon(Icons.arrow_back, color: Colors.white),
  onPressed: () {
     Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => PropertyHomePage()),
    );
  },
),

      ),
      body:SingleChildScrollView(child:
       Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Icon(
                Icons.home_work_outlined,
                size: 80,
                color: Colors.deepPurple,
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                "Property Hub",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
            ),
            SizedBox(height: 10),
            Divider(thickness: 1),
            SizedBox(height: 10),
            Text(
              "Welcome to Property Hub — your trusted partner in finding or listing properties with ease and confidence.",
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            SizedBox(height: 15),
            Text(
              "🏡 What We Do:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text("• Help users rent homes, flats, and apartments."),
            Text("• Allow homeowners to list their property for sale or rent."),
            Text("• Provide a smooth and transparent experience."),
            SizedBox(height: 20),
            Text(
              "🔒 Safe | 💼 Reliable | 🚀 Fast",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.grey[700],
              ),
            ),
            Center(
              child: Text(
                "© 2025 Property Hub. All rights reserved.",
                style: TextStyle(color: Colors.grey),
              ),
            )
          ],
        ),
      ),
      ),
    );
  }
}

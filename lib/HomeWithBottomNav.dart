import 'package:flutter/material.dart';
import 'home.dart';  // your home page with welcome cards etc.
import 'listingpage.dart';            // your ListingPage
import 'profile.dart';            // your profile page

class HomeWithBottomNav extends StatefulWidget {
  const HomeWithBottomNav({Key? key}) : super(key: key);

  @override
  _HomeWithBottomNavState createState() => _HomeWithBottomNavState();
}

class _HomeWithBottomNavState extends State<HomeWithBottomNav> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const PropertyHomePage(),
    const ListingPage(),
     Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.apartment), label: 'Listings'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'login.dart';
import 'about.dart';
import 'seller.dart';
import 'buyer.dart';
import 'profile.dart';

class PropertyHomePage extends StatelessWidget {
  const PropertyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Icon(Icons.home, color: Colors.black),
            SizedBox(width: 8),
            Text(
              'Property Hub',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              height: 80, // custom height here
              color: Colors.deepPurple,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.all(16),
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('About Us'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => About()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: () {
                 Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  Profile()
                    ));
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Exit'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              },
            ),
          ],
        ),
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Container(
          color: Colors.grey.shade100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Welcome!',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Find your perfect place or list your property \nwith ease.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),
              SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      color: Colors.deepPurple.shade400,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Buyer()),
                          );
                        },
                        borderRadius: BorderRadius.circular(20),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              Icon(Icons.house, size: 40, color: Colors.orange),
                              SizedBox(height: 10),
                              Text(
                                "Rent a Property",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "Discover homes,\napartments, and more.",
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white70),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      color: Colors.green.shade400,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Seller()),
                          );
                        },
                        borderRadius: BorderRadius.circular(20),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              Icon(
                                Icons.vpn_key,
                                size: 40,
                                color: Colors.yellow,
                              ),
                              SizedBox(height: 10),
                              Text(
                                "List Your Property",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "Earn income by\nrenting out your space.",
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white70),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
             
            ],
          ),
        ),
      ),
     
    );
  }
}

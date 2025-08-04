import 'package:flutter/material.dart';

class Profile extends StatefulWidget {


  @override
  State<StatefulWidget> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.indigoAccent,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'My Profile',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Profile Picture
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(
                'assets/Rohit_photo.jpeg',
              ), // Use your image here
              backgroundColor: Colors.white,
            ),
            const SizedBox(height: 15),
            
          

            // Info Card
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 16,
                ),
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.person_outline),
                      title: Text("Name"),
                    
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.email_outlined),
                      title: Text("Email"),
                     
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),

            // Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const UpdateProfile(),
                    ),
                  );
                },
                icon: const Icon(Icons.edit, color: Colors.white),
                label: const Text(
                  'Update Your Profile',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});

  @override
  State<StatefulWidget> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Update your profile')));
  }
}

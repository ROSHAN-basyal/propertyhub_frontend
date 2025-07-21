import 'package:flutter/material.dart';

class Seller extends StatefulWidget {
  const Seller({super.key});

  @override
  State<StatefulWidget> createState() => _SellerState();
}

class _SellerState extends State<Seller> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 168, 162, 234), // Soft background
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 131, 146, 241),
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'Sell your Property',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Card(
           color: Colors.blue.shade50,
          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '📝 Fill in the form below to post your property.',
                  style: TextStyle(fontSize: 16, color: Colors.black87),
                ),
                const SizedBox(height: 20),

                // 📍 Area/Location
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Area / Location',
                    hintText: 'e.g. New Road, Kathmandu',
                    prefixIcon: Icon(Icons.location_on),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 12),

                // 🏠 Type
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Type',
                    hintText: 'e.g. 1BHK, 2BHK, Studio',
                    prefixIcon: Icon(Icons.home_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 12),

                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Rent (Rs.per month)',
                    hintText: 'e.g. 15000',
                    prefixIcon: Icon(Icons.currency_rupee), // ₹ icon
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                // 📞 Contact
                TextField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: 'Contact Number',
                    hintText: 'e.g. 9800000000',
                    prefixIcon: Icon(Icons.phone),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 12),

                // 📝 Description
                TextField(
                  maxLines: 5,
                  decoration: InputDecoration(
                    labelText: 'Description',
                    hintText:
                        'Add details about the property, surroundings, etc.',
                    alignLabelWithHint: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // 📤 Post Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Handle post
                    },
                    icon: Icon(Icons.post_add),
                    label: Text(
                      'Post the Property',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 10, 202, 20),
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
        ),
      ),
    );
  }
}

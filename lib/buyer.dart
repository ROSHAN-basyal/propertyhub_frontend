import 'package:flutter/material.dart';

class Buyer extends StatefulWidget {
  const Buyer({super.key});

  @override
  State<StatefulWidget> createState() => _BuyerState();
}

class _BuyerState extends State<Buyer> {
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
          'Rent the Property',
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
                  '📝 Filter by.',
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
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'Type',

                    prefixIcon: Icon(Icons.home_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  items: ['Single', '1BK', '2BK', '1BHK', '2BHK'].map((type) {
                    return DropdownMenuItem(value: type, child: Text(type));
                  }).toList(),
                  onChanged: (value) {
                    // Handle selection
                  },
                ),
                const SizedBox(height: 12),

                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Price Range',
                    hintText: 'e.g. 10000-15000',
                    prefixIcon: Icon(Icons.currency_rupee), // ₹ icon
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
                      'Search for Property',
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

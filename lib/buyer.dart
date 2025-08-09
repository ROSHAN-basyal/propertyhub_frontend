import 'package:flutter/material.dart';
import 'api_service.dart'; // Import your API service

class Buyer extends StatefulWidget {
  const Buyer({super.key});

  @override
  State<Buyer> createState() => _BuyerState();
}

class _BuyerState extends State<Buyer> {
  List<dynamic> properties = [];
  bool isLoading = false;

  // Track booked property IDs
  Set<int> bookedProperties = {};

  // Controllers for filter inputs
  final TextEditingController locationController = TextEditingController();
  final TextEditingController minPriceController = TextEditingController();
  final TextEditingController maxPriceController = TextEditingController();
  String? selectedType;

  @override
  void initState() {
    super.initState();
    _searchProperties(); // Load initial properties on start (empty filters)
  }

  @override
  void dispose() {
    locationController.dispose();
    minPriceController.dispose();
    maxPriceController.dispose();
    super.dispose();
  }

  Future<void> _searchProperties() async {
    setState(() {
      isLoading = true;
    });

    try {
      final results = await ApiService.searchProperties(
        propertyType: selectedType ?? '',
        location: locationController.text.trim(),
        minRent: int.tryParse(minPriceController.text) ?? 0,
        maxRent: int.tryParse(maxPriceController.text) ?? 9999999,
        page: 0,
      );

      setState(() {
        properties = results;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error fetching properties: $e")),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Widget buildPropertyCard(Map<String, dynamic> prop) {
    // Use 'property_id' as unique ID, check booking
    final int propId = prop['property_id'] is int
        ? prop['property_id']
        : int.tryParse(prop['property_id'].toString()) ?? 0;

    final bool isBooked = bookedProperties.contains(propId);

    return GestureDetector(
      onTap: () async {
        if (!isBooked) {
          bool? confirm = await showDialog<bool>(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Book Property'),
              content: const Text('Do you want to book this property?'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context, false),
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context, true),
                  child: const Text('Book'),
                ),
              ],
            ),
          );

          if (confirm == true) {
            setState(() {
              bookedProperties.add(propId);
            });

            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Property booked successfully!')),
            );
          }
        }
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: SizedBox(
          width: double.infinity,
          height: 250,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Stack(
              children: [
                // Property details column
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      prop['area_location'] ?? '',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Property ID: ${prop['property_id']}",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    Text(
                      "User ID: ${prop['listed_by_user_id']}",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    Text(
                      "Listed by: ${prop['listed_by_username'] ?? prop['username'] ?? ''}",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    Text(
                      "Type: ${prop['property_type'] ?? ''}",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    Text(
                      "Rent: Rs. ${prop['rent'] ?? prop['monthly_rent'] ?? ''}",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    Text(
                      "Contact: ${prop['contact_number'] ?? ''}",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    const SizedBox(height: 6),
                    Expanded(
                      child: Text(
                        prop['description'] ??
                            prop['property_description'] ??
                            '',
                        style: TextStyle(color: Colors.grey[700]),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                    ),
                    const SizedBox(height: 6),
                    if (prop['posted_at'] != null)
                      Text(
                        "Posted: ${prop['posted_at'].toString().substring(0, 10)}",
                        style: const TextStyle(
                            fontSize: 12, color: Colors.grey),
                      ),
                  ],
                ),

                // Booked badge on top right
                if (isBooked)
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.green.shade600,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Icon(Icons.check, color: Colors.white, size: 16),
                          SizedBox(width: 4),
                          Text(
                            'Booked',
                            style:
                                TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ],
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

  Widget _buildFilterForm() {
    return Card(
      color: Colors.blue.shade50,
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
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
            TextField(
              controller: locationController,
              decoration: InputDecoration(
                labelText: 'Area / Location',
                hintText: 'e.g. New Road, Kathmandu',
                prefixIcon: const Icon(Icons.location_on),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              value: selectedType,
              decoration: InputDecoration(
                labelText: 'Type',
                prefixIcon: const Icon(Icons.home_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              items: ['Single', '1BK', '2BK', '1BHK', '2BHK'].map((type) {
                return DropdownMenuItem(value: type, child: Text(type));
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedType = value;
                });
              },
            ),
            const SizedBox(height: 12),
            TextField(
              controller: minPriceController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Min price',
                hintText: 'in Rs.',
                prefixIcon: const Icon(Icons.currency_rupee),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: maxPriceController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Max price',
                hintText: 'in Rs.',
                prefixIcon: const Icon(Icons.currency_rupee),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _searchProperties,
                icon: const Icon(Icons.search),
                label: const Text(
                  'Search for Property',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 168, 162, 234),
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 131, 146, 241),
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
        child: Column(
          children: [
            _buildFilterForm(),
            const SizedBox(height: 24),
            const Text(
              "Available Properties",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            if (isLoading)
              const Center(child: CircularProgressIndicator())
            else if (properties.isEmpty)
              const Text("No properties found")
            else
              Column(
                children:
                    properties.map((prop) => buildPropertyCard(prop)).toList(),
              ),
          ],
        ),
      ),
    );
  }
}

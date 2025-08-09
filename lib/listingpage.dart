import 'package:flutter/material.dart';
import 'api_service.dart';

class ListingPage extends StatefulWidget {
  const ListingPage({Key? key}) : super(key: key);

  @override
  _ListingPageState createState() => _ListingPageState();
}

class _ListingPageState extends State<ListingPage> {
  List<dynamic> properties = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadProperties();
  }

  void _loadProperties() async {
    try {
      final data = await ApiService.fetchProperties();
      setState(() {
        properties = data;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to load properties')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Listings')),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : properties.isEmpty
              ? const Center(child: Text('No properties found'))
              : ListView.builder(
                  itemCount: properties.length,
                  itemBuilder: (context, index) {
                    final prop = properties[index];
                    return Card(
                      margin:
                          const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      elevation: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
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
                              "Property ID: ${prop['property_id'] ?? ''}",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            Text(
                              "User ID: ${prop['listed_by_user_id'] ?? ''}",
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
                            Text(
                              prop['description'] ??
                                  prop['property_description'] ??
                                  '',
                              style: TextStyle(color: Colors.grey[700]),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
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
                      ),
                    );
                  },
                ),
    );
  }
}

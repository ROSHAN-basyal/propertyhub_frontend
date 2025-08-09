import 'package:flutter/material.dart';
import 'api_service.dart'; // import your service file

class Seller extends StatefulWidget {
  const Seller({super.key});

  @override
  State<StatefulWidget> createState() => _SellerState();
}

class _SellerState extends State<Seller> {
  // Controllers for inputs
  final TextEditingController areaController = TextEditingController();
  final TextEditingController rentController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  String? selectedType;

  bool isLoading = false;

  Future<void> submitProperty() async {
    if (areaController.text.isEmpty ||
        selectedType == null ||
        rentController.text.isEmpty ||
        contactController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please fill all required fields")),
      );
      return;
    }

    setState(() => isLoading = true);

    final result = await ApiService.postProperty(
      areaLocation: areaController.text.trim(),
      propertyType: selectedType!,
      rent: rentController.text.trim(),
      contactNumber: contactController.text.trim(),
      description: descriptionController.text.trim(),
    );

    setState(() => isLoading = false);

    if (result == 1) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("✅ Property added successfully")),
      );
      // Optional: Clear form
      areaController.clear();
      rentController.clear();
      contactController.clear();
      descriptionController.clear();
      setState(() => selectedType = null);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("❌ Failed to add property")),
      );
    }
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

                TextField(
                  controller: areaController,
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
                  items: ['Single', '1BK', '2BK', '1BHK', '2BHK']
                      .map((type) => DropdownMenuItem(
                            value: type,
                            child: Text(type),
                          ))
                      .toList(),
                  onChanged: (value) => setState(() => selectedType = value),
                ),
                const SizedBox(height: 12),

                TextField(
                  controller: rentController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Rent (Rs.per month)',
                    hintText: 'e.g. 15000',
                    prefixIcon: const Icon(Icons.currency_rupee),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 12),

                TextField(
                  controller: contactController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: 'Contact Number',
                    hintText: 'e.g. 9800000000',
                    prefixIcon: const Icon(Icons.phone),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 12),

                TextField(
                  controller: descriptionController,
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

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: isLoading ? null : submitProperty,
                    icon: isLoading
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : const Icon(Icons.post_add),
                    label: Text(
                      isLoading
                          ? 'Posting...'
                          : 'Post the Property',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          const Color.fromARGB(255, 10, 202, 20),
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

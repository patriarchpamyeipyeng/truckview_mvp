import 'package:flutter/material.dart';

class RequestService extends StatefulWidget {
  const RequestService({super.key});

  @override
  State<RequestService> createState() => _RequestServiceState();
}

class _RequestServiceState extends State<RequestService> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final vehicleController = TextEditingController();
  final issueController = TextEditingController();

  void submitRequest() {
    if (nameController.text.isEmpty ||
        phoneController.text.isEmpty ||
        vehicleController.text.isEmpty ||
        issueController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill all fields")),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Request submitted successfully 🚗")),
    );

    nameController.clear();
    phoneController.clear();
    vehicleController.clear();
    issueController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A1F44),

      appBar: AppBar(
        backgroundColor: const Color(0xFF0A1F44),
        title: const Text("Request Service"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: "Full Name",
              ),
            ),

            TextField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: "Phone Number",
              ),
            ),

            TextField(
              controller: vehicleController,
              decoration: const InputDecoration(
                labelText: "Vehicle Type",
              ),
            ),

            TextField(
              controller: issueController,
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: "Problem Description",
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: submitRequest,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF7A00),
                ),
                child: const Text("Submit Request"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
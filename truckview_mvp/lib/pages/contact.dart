import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  final String phoneNumber = "tel:08036798700";
  final String whatsappNumber = "https://wa.me/2348036798700";

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);

    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw "Could not launch $url";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A1F44),

      appBar: AppBar(
        backgroundColor: const Color(0xFF0A1F44),
        title: const Text("Contact Us"),
        elevation: 0,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            // 📞 HEADER CARD
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Column(
                children: [

                  Icon(
                    Icons.support_agent,
                    size: 60,
                    color: Color(0xFFFF7A00),
                  ),

                  SizedBox(height: 10),

                  Text(
                    "Need Help?",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 5),

                  Text(
                    "Contact TruckView Mobile anytime",
                    style: TextStyle(color: Colors.black54),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // 📞 CALL BUTTON
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF7A00),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                icon: const Icon(Icons.call),
                label: const Text("Call Us"),
                onPressed: () {
                  _launchUrl("tel:08036798700");
                },
              ),
            ),

            const SizedBox(height: 15),

            // 💬 WHATSAPP BUTTON
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                icon: const Icon(Icons.chat),
                label: const Text("Chat on WhatsApp"),
                onPressed: () {
                  _launchUrl("https://wa.me/2348036798700?text=Hello%20TruckView,%20I%20need%20your%20service");
                },
              ),
            ),

            const SizedBox(height: 20),

            // 📍 INFO SECTION
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    "Company Info",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 10),

                  Text("📍 Location: Abuja, Nigeria"),
                  SizedBox(height: 5),
                  Text("📞 Phone: 08036798700"),
                  SizedBox(height: 5),
                  Text("🕒 Available: 24/7 Emergency Service"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
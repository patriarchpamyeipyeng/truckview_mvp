import 'package:flutter/material.dart';
import 'package:truckview_mvp/pages/contact.dart';
import 'package:truckview_mvp/pages/login.dart';
import 'package:truckview_mvp/pages/profile.dart';
import 'package:truckview_mvp/pages/services.dart';
import 'package:truckview_mvp/pages/request_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A1F44),

      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 235, 121, 15),
        elevation: 0,
        title: const Text(
          "TruckView Mobile",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        
        child: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [

    Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),

      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(
            "Welcome Back 👋",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 5),

          Text(
            "Your satisfaction is our clarion call",
            style: TextStyle(
              color: Colors.black54,
            ),
          ),
        ],
      ),
    ),

    const SizedBox(height: 20),

            // Service cards (Figma style)
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                children: const [
                  ServiceCard(title: "Engine Repair", icon: Icons.settings),
                  ServiceCard(title: "Diagnostics", icon: Icons.car_repair),
                  ServiceCard(title: "Towing", icon: Icons.local_shipping),
                  ServiceCard(title: "Battery", icon: Icons.battery_charging_full),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 🔧 Reusable Card
class ServiceCard extends StatelessWidget {
  final String title;
  final IconData icon;

  const ServiceCard({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 40,
            color: Color(0xFFFF7A00),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
class HomeCard extends StatelessWidget {
  final IconData icon;
  final String title;

  const HomeCard({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: const Color(0xFFFF7A00)),
          const SizedBox(height: 10),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const SizedBox(height: 20),

            const Text(
              "Welcome Back 👋",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 5),

            const Text(
              "We fix all vehicle types!",
              style: TextStyle(color: Colors.white70),
            ),

            const SizedBox(height: 25),

            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              children: [

                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const ServicesPage(),
                      ),
                    );
                  },
                  child: const HomeCard(
                    icon: Icons.engineering,
                    title: "Engine Repair",
                  ),
                ),

                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const RequestService(),
                      ),
                    );
                  },
                  child: const HomeCard(
                    icon: Icons.car_repair,
                    title: "Diagnostics",
                  ),
                ),

                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const RequestService(),
                      ),
                    );
                  },
                  child: const HomeCard(
                    icon: Icons.local_shipping,
                    title: "Towing",
                  ),
                ),

                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const RequestService(),
                      ),
                    );
                  },
                  child: const HomeCard(
                    icon: Icons.battery_charging_full,
                    title: "Battery",
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
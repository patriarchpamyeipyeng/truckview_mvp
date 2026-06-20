import 'package:flutter/material.dart';
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
        backgroundColor: const Color(0xFF0A1F44),
        elevation: 0,
        title: const Text(
          "TruckView Mobile",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF0A1F44),
              ),
              child: Text(
                "TruckView Menu",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Home"),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.build),
              title: const Text("Services"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ServicesPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.contact_phone),
              title: const Text("Contact"),
              onTap: () {},
            ),
            ListTile(
  leading: const Icon(Icons.logout),
  title: const Text("Logout"),
  onTap: () {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (_) => const LoginPage(),
      ),
      (route) => false,
    );
  },
),
ListTile(
  leading: const Icon(Icons.person),
  title: const Text("Profile"),
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const ProfilePage(),
      ),
    );
  },
),
          ],
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

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
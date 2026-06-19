import 'package:flutter/material.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A1F44),

      appBar: AppBar(
        backgroundColor: const Color(0xFF0A1F44),
        elevation: 0,
        title: const Text(
          "Our Services",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text(
              "What we offer",
              style: TextStyle(
                color: Colors.white70,
                fontSize: 14,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              "TruckView Services",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                children: const [

                  ServiceCard(
                    icon: Icons.engineering,
                    title: "Engine Repair",
                    desc: "Full diagnostics & repair",
                  ),

                  ServiceCard(
                    icon: Icons.car_repair,
                    title: "Vehicle Diagnosis",
                    desc: "Computer scanning",
                  ),

                  ServiceCard(
                    icon: Icons.local_shipping,
                    title: "Towing Service",
                    desc: "24/7 emergency towing",
                  ),

                  ServiceCard(
                    icon: Icons.battery_charging_full,
                    title: "Battery Service",
                    desc: "Replacement & jumpstart",
                  ),

                  ServiceCard(
                    icon: Icons.oil_barrel,
                    title: "Oil Change",
                    desc: "Engine oil servicing",
                  ),

                  ServiceCard(
                    icon: Icons.build_circle,
                    title: "General Maintenance",
                    desc: "Full vehicle care",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String desc;

  const ServiceCard({
    super.key,
    required this.icon,
    required this.title,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFFFF7A00).withOpacity(0.15),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              icon,
              color: const Color(0xFFFF7A00),
              size: 26,
            ),
          ),

          const SizedBox(height: 12),

          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),

          const SizedBox(height: 4),

          Text(
            desc,
            style: const TextStyle(
              fontSize: 11,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
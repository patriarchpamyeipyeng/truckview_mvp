import 'package:flutter/material.dart';
import 'package:truckview_mvp/theme/app_theme.dart';
import 'package:truckview_mvp/pages/request_service.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({Key? key}) : super(key: key);

  // 1. Define our services data list matching the web app catalog
  final List<Map<String, dynamic>> _serviceList = const [
    {
      'title': 'Routine Maintenance',
      'price': '₦35,000',
      'duration': '2 hrs',
      'icon': Icons.build_circle_outlined,
      'description': 'Routine car servicing to keep your vehicle running smoothly and prevent major breakdowns.',
    },
    {
      'title': 'Vehicle Inspection',
      'price': '₦15,000',
      'duration': '1 hr',
      'icon': Icons.fact_check_outlined,
      'description': 'Comprehensive diagnostic health check and detailed report for peace of mind.',
    },
    {
      'title': 'Engine Diagnostics',
      'price': '₦25,000',
      'duration': '1.5 hrs',
      'icon': Icons.settings_suggest_outlined,
      'description': 'Scan and clear error codes, deep electronic sensor check, and performance tuning.',
    },
    {
      'title': 'Tyres & Brakes',
      'price': '₦20,000',
      'duration': '1 hr',
      'icon': Icons.tire_repair,
      'description': 'Brake pad replacement, wheel alignment, balancing, and thorough tyre health checks.',
    },
    {
      'title': 'Detailing & Care',
      'price': '₦30,000',
      'duration': '3 hrs',
      'icon': Icons.local_car_wash_outlined,
      'description': 'Full interior vacuum, dashboard conditioning, and exterior professional wash.',
    },
    {
      'title': 'Mobile Assistance',
      'price': '₦40,000',
      'duration': 'On-site',
      'icon': Icons.emergency_outlined,
      'description': 'Emergency roadside dispatch for breakdown rescue and immediate on-site mobile repair.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Our Services'),
        backgroundColor: AppTheme.darkBackground,
        elevation: 0,
      ),
      // 2. Use a ListView to display items cleanly in a vertical scrollable feed
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: _serviceList.length,
        itemBuilder: (context, index) {
          final service = _serviceList[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppTheme.surfaceCard, // Matches our dark slate card theme
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppTheme.surfaceCardBorder),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    // Service Icon container with primary orange accent
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppTheme.primaryOrange.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(service['icon'], color: AppTheme.primaryOrange, size: 28),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            service['title'],
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppTheme.textWhite,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            'Estimated Time: ${service['duration']}',
                            style: const TextStyle(fontSize: 12, color: AppTheme.primaryOrange),
                          ),
                        ],
                      ),
                    ),
                    // Price Tag
                    Text(
                      service['price'],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.primaryOrange,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                const Divider(color: AppTheme.surfaceCardBorder),
                const SizedBox(height: 8),
                Text(
                  service['description'],
                  style: const TextStyle(fontSize: 13, color: AppTheme.textMuted),
                ),
                const SizedBox(height: 14),
                
                // Action Button to jump straight to booking this service
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const RequestServicePage()),
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: AppTheme.primaryOrange),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                    ),
                    child: const Text(
                      'Book This Service',
                      style: TextStyle(color: AppTheme.primaryOrange, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
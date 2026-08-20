import 'package:flutter/material.dart';
import 'package:truckview_mvp/theme/app_theme.dart';
import 'package:url_launcher/url_launcher.dart';

class CallPage extends StatelessWidget {
  const CallPage({Key? key}) : super(key: key);

  // Function to trigger direct phone call
  Future<void> _makeEmergencyCall(BuildContext context) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: '08036798700',
    );
    try {
      if (await canLaunchUrl(launchUri)) {
        await launchUrl(launchUri);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Could not launch dialer for 0803 679 8700')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  // Function to trigger WhatsApp chat support
  Future<void> _openWhatsApp(BuildContext context) async {
    final Uri whatsappUri = Uri.parse('https://wa.me/2348036798700?text=Hello%20Truck-View,%20I%20need%20emergency%20roadside%20assistance.');
    try {
      if (await canLaunchUrl(whatsappUri)) {
        await launchUrl(whatsappUri, mode: LaunchMode.externalApplication);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Could not launch WhatsApp')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Emergency & Direct Support'),
        backgroundColor: AppTheme.darkBackground,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            // Pulsing / Alert Icon Container
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: AppTheme.primaryOrange.withOpacity(0.15),
                shape: BoxShape.circle,
                border: Border.all(color: AppTheme.primaryOrange, width: 2),
              ),
              child: const Icon(
                Icons.support_agent,
                size: 64,
                color: AppTheme.primaryOrange,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Stranded on the Road?',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppTheme.textWhite,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Our certified mobile workshop dispatchers and technicians in Karu District, Abuja are on standby to rescue your vehicle.',
              textAlign: TextAlign.center,
              style: TextStyle(color: AppTheme.textMuted, fontSize: 14),
            ),
            const SizedBox(height: 40),

            // Emergency Call Button
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton.icon(
                onPressed: () => _makeEmergencyCall(context),
                icon: const Icon(Icons.phone_in_talk, color: Colors.white),
                label: const Text(
                  'Call Emergency Line: 0803 679 8700',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.errorRed, // Stands out for emergency
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // WhatsApp Support Button
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton.icon(
                onPressed: () => _openWhatsApp(context),
                icon: const Icon(Icons.chat, color: Colors.white),
                label: const Text(
                  'Chat on WhatsApp',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF25D366), // WhatsApp Green
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ),
            const Spacer(),

            // Location Info Footer
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppTheme.surfaceCard,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppTheme.surfaceCardBorder),
              ),
              child: const Row(
                children: [
                  Icon(Icons.location_on, color: AppTheme.primaryOrange),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Base: Behind Games Village, Deck One Apartments, Karu District, Abuja',
                      style: TextStyle(fontSize: 12, color: AppTheme.textMuted),
                    ),
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
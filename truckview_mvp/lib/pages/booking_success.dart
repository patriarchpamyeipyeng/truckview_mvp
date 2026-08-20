import 'package:flutter/material.dart';
import 'package:truckview_mvp/theme/app_theme.dart';
import 'package:truckview_mvp/pages/main_screen.dart'; // Or your home route

class BookingSuccessPage extends StatelessWidget {
  final String serviceName;
  final String vehicleType;
  final String location;
  final double price;

  const BookingSuccessPage({
    Key? key,
    required this.serviceName,
    required this.vehicleType,
    required this.location,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Success Icon Container
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppTheme.primaryOrange.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check_circle,
                  color: AppTheme.primaryOrange,
                  size: 64,
                ),
              ),
              const SizedBox(height: 24),
              
              const Text(
                'Booking Confirmed!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.textWhite,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Your service request has been successfully dispatched to our certified mobile mechanics.',
                textAlign: TextAlign.center,
                style: TextStyle(color: AppTheme.textMuted, fontSize: 14),
              ),
              const SizedBox(height: 32),

              // Booking Details Card
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppTheme.surfaceCard,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppTheme.surfaceCardBorder),
                ),
                child: Column(
                  children: [
                    _buildDetailRow('Service', serviceName),
                    const Divider(color: AppTheme.surfaceCardBorder, height: 24),
                    _buildDetailRow('Vehicle Type', vehicleType),
                    const Divider(color: AppTheme.surfaceCardBorder, height: 24),
                    _buildDetailRow('Location', location),
                    const Divider(color: AppTheme.surfaceCardBorder, height: 24),
                    _buildDetailRow('Total Cost', '₦${price.toStringAsFixed(0)}', isPrice: true),
                  ],
                ),
              ),
              const SizedBox(height: 40),

              // Action Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate back to MainScreen / Home
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const MainScreen()),
                      (route) => false,
                    );
                  },
                  child: const Text('Back to Home'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, {bool isPrice = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(color: AppTheme.textMuted, fontSize: 14)),
        Text(
          value,
          style: TextStyle(
            color: isPrice ? AppTheme.primaryOrange : AppTheme.textWhite,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
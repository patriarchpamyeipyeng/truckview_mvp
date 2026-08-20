import 'package:flutter/material.dart';
import 'package:truckview_mvp/theme/app_theme.dart';

class TrackBookingPage extends StatefulWidget {
  const TrackBookingPage({Key? key}) : super(key: key);

  @override
  State<TrackBookingPage> createState() => _TrackBookingPageState();
}

class _TrackBookingPageState extends State<TrackBookingPage> {
  final _trackingController = TextEditingController();
  bool _isSearching = false;
  Map<String, dynamic>? _activeBooking;

  // Mock database lookup for tracking IDs
  final List<Map<String, dynamic>> _mockBookings = [
    {
      'id': 'TV-8821',
      'service': 'General Maintenance',
      'vehicle': 'SUV / Crossover',
      'location': 'Karu District, Abuja',
      'status': 'In Progress',
      'mechanic': 'St. Paul (Lead Tech)',
      'time': 'Today, 2:00 PM',
    },
    {
      'id': 'TV-4019',
      'service': 'Mobile Assistance (Emergency)',
      'vehicle': 'Pickup Truck',
      'location': 'Lugbe Expressway',
      'status': 'Dispatched',
      'mechanic': 'Team Alpha',
      'time': 'Today, 11:30 AM',
    },
  ];

  @override
  void dispose() {
    _trackingController.dispose();
    super.dispose();
  }

  void _searchBooking() {
    final query = _trackingController.text.trim().toUpperCase();
    if (query.isEmpty) return;

    setState(() {
      _isSearching = true;
      _activeBooking = null;
    });

    // Simulate network delay
    Future.delayed(const Duration(milliseconds: 800), () {
      final found = _mockBookings.firstWhere(
        (b) => b['id'] == query,
        orElse: () => {},
      );

      setState(() {
        _isSearching = false;
        _activeBooking = found.isNotEmpty ? found : null;
      });

      if (found.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Booking ID not found. Try TV-8821 or TV-4019.')),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Track Booking'),
        backgroundColor: AppTheme.darkBackground,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Real-Time Service Tracker',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: AppTheme.textWhite),
            ),
            const SizedBox(height: 6),
            const Text(
              'Enter your booking ID below to check live status or view your active dispatches.',
              style: TextStyle(color: AppTheme.textMuted, fontSize: 13),
            ),
            const SizedBox(height: 20),

            // Search Bar Input Container
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: AppTheme.surfaceCard,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppTheme.surfaceCardBorder),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 12),
                  const Icon(Icons.search, color: AppTheme.primaryOrange),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      controller: _trackingController,
                      style: const TextStyle(color: AppTheme.textWhite),
                      decoration: const InputDecoration(
                        hintText: 'Enter ID (e.g. TV-8821)',
                        hintStyle: TextStyle(color: AppTheme.textMuted),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: _isSearching ? null : _searchBooking,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.primaryOrange,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: _isSearching
                        ? const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
                        : const Text('Track', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 28),

            // Display Result if Found
            if (_activeBooking != null) ...[
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppTheme.surfaceCard,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppTheme.primaryOrange, width: 1.5),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _activeBooking!['id'],
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppTheme.primaryOrange),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: AppTheme.primaryOrange.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            _activeBooking!['status'],
                            style: const TextStyle(color: AppTheme.primaryOrange, fontSize: 11, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    const Divider(color: AppTheme.surfaceCardBorder, height: 24),
                    _buildInfoRow('Service', _activeBooking!['service']),
                    const SizedBox(height: 8),
                    _buildInfoRow('Vehicle', _activeBooking!['vehicle']),
                    const SizedBox(height: 8),
                    _buildInfoRow('Location', _activeBooking!['location']),
                    const SizedBox(height: 8),
                    _buildInfoRow('Assigned Tech', _activeBooking!['mechanic']),
                    const SizedBox(height: 8),
                    _buildInfoRow('Time', _activeBooking!['time']),
                  ],
                ),
              ),
              const SizedBox(height: 28),
            ],

            // Active Dispatches Feed Header
            const Text(
              'Your Recent Dispatches',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppTheme.textWhite),
            ),
            const SizedBox(height: 12),

            // List of mock active history cards
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _mockBookings.length,
              itemBuilder: (context, index) {
                final item = _mockBookings[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppTheme.surfaceCard,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppTheme.surfaceCardBorder),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: AppTheme.primaryOrange.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(Icons.local_shipping, color: AppTheme.primaryOrange),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item['service'],
                              style: const TextStyle(fontWeight: FontWeight.bold, color: AppTheme.textWhite, fontSize: 14),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              'ID: ${item['id']} • ${item['location']}',
                              style: const TextStyle(color: AppTheme.textMuted, fontSize: 11),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        item['status'],
                        style: const TextStyle(color: AppTheme.primaryOrange, fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(color: AppTheme.textMuted, fontSize: 13)),
        Text(value, style: const TextStyle(color: AppTheme.textWhite, fontWeight: FontWeight.w600, fontSize: 13)),
      ],
    );
  }
}
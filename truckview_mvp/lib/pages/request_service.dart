import 'package:flutter/material.dart';
import 'package:truckview_mvp/theme/app_theme.dart';
import 'package:truckview_mvp/pages/booking_success.dart';

class RequestServicePage extends StatefulWidget {
  const RequestServicePage({Key? key}) : super(key: key);

  @override
  State<RequestServicePage> createState() => _RequestServicePageState();
}

class _RequestServicePageState extends State<RequestServicePage> {
  int _currentStep = 0;

  // Selected Options
  String? _selectedVehicleType;
  String? _selectedService;
  double _servicePrice = 0.0;
  
  final _locationController = TextEditingController();
  final _plateController = TextEditingController();
  final _notesController = TextEditingController();

  final List<Map<String, dynamic>> _vehicleTypes = [
    {'name': 'SUV / Crossover', 'icon': Icons.airport_shuttle},
    {'name': 'Pickup Truck', 'icon': Icons.local_shipping},
    {'name': 'Sedan / Salon', 'icon': Icons.directions_car},
    {'name': 'Van / Minivan', 'icon': Icons.airport_shuttle},
    {'name': 'Minibus', 'icon': Icons.bus_alert},
    {'name': 'Commercial / Fleet', 'icon': Icons.fire_truck},
  ];

  final List<Map<String, dynamic>> _services = [
    {'name': 'General Maintenance', 'price': 35000.0, 'duration': '2 hrs', 'desc': 'Routine car servicing to keep your vehicle running smoothly.'},
    {'name': 'Vehicle Inspection', 'price': 15000.0, 'duration': '1 hr', 'desc': 'Comprehensive diagnostic health check & report.'},
    {'name': 'Engine Diagnostics', 'price': 25000.0, 'duration': '1.5 hrs', 'desc': 'Scan and clear error codes, sensor check.'},
    {'name': 'Tyres & Brakes', 'price': 20000.0, 'duration': '1 hr', 'desc': 'Brake pad replacement, alignment & tyre checks.'},
    {'name': 'Detailing & Care', 'price': 30000.0, 'duration': '3 hrs', 'desc': 'Full interior & exterior professional cleaning.'},
    {'name': 'Mobile Assistance (Emergency)', 'price': 40000.0, 'duration': 'On-site', 'desc': 'Emergency roadside dispatch for breakdown rescue.'},
  ];

  @override
  void dispose() {
    _locationController.dispose();
    _plateController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  void _submitBooking() {
    if (_selectedVehicleType == null || _selectedService == null || _locationController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please complete all required fields and location.')),
      );
      return;
    }

    // Navigate to Success screen
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => BookingSuccessPage(
          serviceName: _selectedService!,
          vehicleType: _selectedVehicleType!,
          location: _locationController.text,
          price: _servicePrice,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book a Service'),
        backgroundColor: AppTheme.darkBackground,
        elevation: 0,
      ),
      body: Stepper(
        type: StepperType.vertical,
        currentStep: _currentStep,
        onStepContinue: () {
          if (_currentStep == 0 && _selectedVehicleType == null) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please select a vehicle type')));
            return;
          }
          if (_currentStep == 1 && _selectedService == null) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please select a service')));
            return;
          }
          if (_currentStep < 2) {
            setState(() => _currentStep += 1);
          } else {
            _submitBooking();
          }
        },
        onStepCancel: () {
          if (_currentStep > 0) {
            setState(() => _currentStep -= 1);
          }
        },
        controlsBuilder: (context, details) {
          return Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: details.onStepContinue,
                    child: Text(_currentStep == 2 ? 'Confirm & Book Now' : 'Continue'),
                  ),
                ),
                if (_currentStep > 0) ...[
                  const SizedBox(width: 12),
                  OutlinedButton(
                    onPressed: details.onStepCancel,
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                      side: const BorderSide(color: AppTheme.surfaceCardBorder),
                    ),
                    child: const Text('Back', style: TextStyle(color: AppTheme.textWhite)),
                  ),
                ],
              ],
            ),
          );
        },
        steps: [
          // Step 1: Vehicle Category Selection
          Step(
            title: const Text('Select Vehicle Category'),
            content: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 2.2,
              ),
              itemCount: _vehicleTypes.length,
              itemBuilder: (context, index) {
                final v = _vehicleTypes[index];
                final isSelected = _selectedVehicleType == v['name'];
                return InkWell(
                  onTap: () => setState(() => _selectedVehicleType = v['name']),
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: isSelected ? AppTheme.primaryOrange.withOpacity(0.2) : AppTheme.surfaceCard,
                      border: Border.all(
                        color: isSelected ? AppTheme.primaryOrange : AppTheme.surfaceCardBorder,
                        width: isSelected ? 2 : 1,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Icon(v['icon'], color: isSelected ? AppTheme.primaryOrange : AppTheme.textMuted),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            v['name'],
                            style: TextStyle(
                              color: isSelected ? AppTheme.textWhite : AppTheme.textMuted,
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            isActive: _currentStep >= 0,
          ),

          // Step 2: Choose Service & Pricing
          Step(
            title: const Text('Choose Service Package'),
            content: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _services.length,
              itemBuilder: (context, index) {
                final s = _services[index];
                final isSelected = _selectedService == s['name'];
                return Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _selectedService = s['name'];
                        _servicePrice = s['price'];
                      });
                    },
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: isSelected ? AppTheme.primaryOrange.withOpacity(0.15) : AppTheme.surfaceCard,
                        border: Border.all(
                          color: isSelected ? AppTheme.primaryOrange : AppTheme.surfaceCardBorder,
                          width: isSelected ? 2 : 1,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(s['name'], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                                const SizedBox(height: 4),
                                Text(s['desc'], style: const TextStyle(fontSize: 12, color: AppTheme.textMuted)),
                                const SizedBox(height: 8),
                                Text('Duration: ${s['duration']}', style: const TextStyle(fontSize: 11, color: AppTheme.primaryOrange)),
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                '₦${s['price'].toStringAsFixed(0)}',
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: AppTheme.primaryOrange),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            isActive: _currentStep >= 1,
          ),

          // Step 3: Location & Details
          Step(
            title: const Text('Location & Details'),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Where should our mobile workshop or mechanic meet you?', style: TextStyle(color: AppTheme.textMuted, fontSize: 13)),
                const SizedBox(height: 16),
                TextField(
                  controller: _locationController,
                  decoration: const InputDecoration(
                    labelText: 'Service Address / Location (e.g. Karu District, Abuja)',
                    prefixIcon: Icon(Icons.location_on, color: AppTheme.primaryOrange),
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: _plateController,
                  decoration: const InputDecoration(
                    labelText: 'Vehicle Plate Number (Optional)',
                    prefixIcon: Icon(Icons.directions_car, color: AppTheme.primaryOrange),
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: _notesController,
                  maxLines: 3,
                  decoration: const InputDecoration(
                    labelText: 'Additional Notes / Symptoms (e.g. Engine making ticking sound)',
                    alignLabelWithHint: true,
                  ),
                ),
              ],
            ),
            isActive: _currentStep >= 2,
          ),
        ],
      ),
    );
  }
}
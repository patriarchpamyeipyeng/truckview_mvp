import 'package:flutter/material.dart';
import 'package:truckview_mvp/theme/app_theme.dart';
import 'package:truckview_mvp/pages/login.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- 1. PAGE TITLE ---
              const Text(
                'Profile',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.textWhite,
                ),
              ),
              const SizedBox(height: 20),

              // --- 2. USER INFO CARD ---
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // Avatar Icon
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppTheme.primaryOrange,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.person,
                        size: 40,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Blaze', // Using your personalized nickname!
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'user@email.com',
                      style: TextStyle(fontSize: 13, color: Colors.grey),
                    ),
                    const SizedBox(height: 2),
                    const Text(
                      '08036798700',
                      style: TextStyle(fontSize: 13, color: Colors.grey, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 28),

              // --- 3. ACCOUNT SECTION HEADER ---
              const Text(
                'Account Settings',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.textWhite,
                ),
              ),
              const SizedBox(height: 12),

              // --- 4. SETTINGS LIST CARD ---
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    _buildSettingItem(
                      icon: Icons.edit_outlined,
                      title: 'Edit Profile',
                      subtitle: 'Update your personal details',
                      onTap: () {
                        // Action for editing profile
                      },
                    ),
                    const Divider(height: 1, indent: 60, color: Colors.grey),
                    _buildSettingItem(
                      icon: Icons.history_rounded,
                      title: 'Booking History',
                      subtitle: 'View past mechanical services & rescues',
                      onTap: () {
                        // Action for history
                      },
                    ),
                    const Divider(height: 1, indent: 60, color: Colors.grey),
                    _buildSettingItem(
                      icon: Icons.settings_outlined,
                      title: 'App Settings',
                      subtitle: 'Notifications, dark theme & preferences',
                      onTap: () {
                        // Action for settings
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 28),

              // --- 5. LOGOUT BUTTON ---
              SizedBox(
                width: double.infinity,
                height: 50,
                child: OutlinedButton.icon(
                  onPressed: () {
                    // Clear history and go back to Login screen
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginPage()),
                      (route) => false,
                    );
                  },
                  icon: const Icon(Icons.logout_rounded, color: AppTheme.primaryOrange),
                  label: const Text(
                    'Logout',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.primaryOrange,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: AppTheme.primaryOrange, width: 1.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    backgroundColor: AppTheme.primaryOrange.withOpacity(0.05),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Reusable helper widget to build clean list rows
  Widget _buildSettingItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppTheme.primaryOrange.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: AppTheme.primaryOrange, size: 22),
      ),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black87, fontSize: 14),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(color: Colors.grey, fontSize: 11),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
      onTap: onTap,
    );
  }
}
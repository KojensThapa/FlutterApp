import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationsEnabled = true;
  bool _darkModeEnabled = false;
  bool _biometricAuthEnabled = false;
  String _selectedLanguage = 'English';
  String _selectedTheme = 'System Default';

  void _showSignOutConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Sign Out"),
          content: const Text("Are you sure you want to sign out?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                _signOut(context); // Perform sign out
              },
              child: const Text(
                "Sign Out",
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }

  void _signOut(BuildContext context) {
    // Navigate back to LoginScreen and remove all previous routes
    Navigator.pushNamedAndRemoveUntil(
      context,
      '/login', // Make sure you have a named route for LoginScreen
      (Route<dynamic> route) => false,
    );
    
    // Alternatively, if you're not using named routes:
    // Navigator.of(context).pushAndRemoveUntil(
    //   MaterialPageRoute(builder: (context) => LoginScreen()),
    //   (Route<dynamic> route) => false,
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Settings",
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: const Color(0xFF4A64F6),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Account Section
            const Text(
              "Account",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1E2A4B),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  _buildSettingsItem(
                    icon: Icons.person_outline,
                    title: "Edit Profile",
                    onTap: () {},
                  ),
                  _buildDivider(),
                  _buildSettingsItem(
                    icon: Icons.lock_outline,
                    title: "Change Password",
                    onTap: () {},
                  ),
                  _buildDivider(),
                  _buildSettingsItem(
                    icon: Icons.privacy_tip_outlined,
                    title: "Privacy & Security",
                    onTap: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Preferences Section
            const Text(
              "Preferences",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1E2A4B),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  _buildSettingsItemWithSwitch(
                    icon: Icons.notifications_active_outlined,
                    title: "Notifications",
                    value: _notificationsEnabled,
                    onChanged: (value) {
                      setState(() {
                        _notificationsEnabled = value;
                      });
                    },
                  ),
                  _buildDivider(),
                  _buildSettingsItemWithSwitch(
                    icon: Icons.dark_mode_outlined,
                    title: "Dark Mode",
                    value: _darkModeEnabled,
                    onChanged: (value) {
                      setState(() {
                        _darkModeEnabled = value;
                      });
                    },
                  ),
                  _buildDivider(),
                  _buildSettingsItemWithSwitch(
                    icon: Icons.fingerprint,
                    title: "Biometric Authentication",
                    value: _biometricAuthEnabled,
                    onChanged: (value) {
                      setState(() {
                        _biometricAuthEnabled = value;
                      });
                    },
                  ),
                  _buildDivider(),
                  _buildSettingsItemWithDropdown(
                    icon: Icons.language,
                    title: "Language",
                    value: _selectedLanguage,
                    items: const ['English', 'Spanish', 'French', 'German'],
                    onChanged: (value) {
                      setState(() {
                        _selectedLanguage = value!;
                      });
                    },
                  ),
                  _buildDivider(),
                  _buildSettingsItemWithDropdown(
                    icon: Icons.palette_outlined,
                    title: "App Theme",
                    value: _selectedTheme,
                    items: const ['System Default', 'Light', 'Dark'],
                    onChanged: (value) {
                      setState(() {
                        _selectedTheme = value!;
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Support Section
            const Text(
              "Support",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1E2A4B),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  _buildSettingsItem(
                    icon: Icons.help_outline,
                    title: "Help Center",
                    onTap: () {},
                  ),
                  _buildDivider(),
                  _buildSettingsItem(
                    icon: Icons.feedback_outlined,
                    title: "Send Feedback",
                    onTap: () {},
                  ),
                  _buildDivider(),
                  _buildSettingsItem(
                    icon: Icons.description_outlined,
                    title: "Terms of Service",
                    onTap: () {},
                  ),
                  _buildDivider(),
                  _buildSettingsItem(
                    icon: Icons.security_outlined,
                    title: "Privacy Policy",
                    onTap: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // App Info Section
            const Text(
              "About",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1E2A4B),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  _buildSettingsItem(
                    icon: Icons.info_outline,
                    title: "App Version",
                    trailing: const Text(
                      "1.0.0",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    onTap: () {},
                  ),
                  _buildDivider(),
                  _buildSettingsItem(
                    icon: Icons.star_outline,
                    title: "Rate App",
                    onTap: () {},
                  ),
                  _buildDivider(),
                  _buildSettingsItem(
                    icon: Icons.share_outlined,
                    title: "Share App",
                    onTap: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // Sign Out Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  _showSignOutConfirmation(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Sign Out",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsItem({
    required IconData icon,
    required String title,
    Widget? trailing,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: const Color(0xFF4A64F6),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          color: Color(0xFF1E2A4B),
        ),
      ),
      trailing: trailing ?? const Icon(Icons.chevron_right, color: Colors.grey),
      onTap: onTap,
    );
  }

  Widget _buildSettingsItemWithSwitch({
    required IconData icon,
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: const Color(0xFF4A64F6),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          color: Color(0xFF1E2A4B),
        ),
      ),
      trailing: Switch(
        value: value,
        onChanged: onChanged,
        activeColor: const Color(0xFF4A64F6),
      ),
    );
  }

  Widget _buildSettingsItemWithDropdown({
    required IconData icon,
    required String title,
    required String value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: const Color(0xFF4A64F6),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          color: Color(0xFF1E2A4B),
        ),
      ),
      trailing: DropdownButton<String>(
        value: value,
        underline: const SizedBox(),
        items: items.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }

  Widget _buildDivider() {
    return const Divider(
      height: 1,
      indent: 56,
      endIndent: 16,
    );
  }
}
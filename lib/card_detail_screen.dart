import 'package:flutter/material.dart';

class CardDetailScreen extends StatelessWidget {
  final String name;

  const CardDetailScreen({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    // Sample data for demonstration
    final Map<String, String> contactDetails = {
      "phone": "+977-9812345678",
      "email": "${name.toLowerCase().replaceAll(' ', '.')}@example.com",
      "position": "Senior Developer",
      "company": "Tech Solutions Inc.",
      "address": "Kathmandu, Nepal"
    };

    return Scaffold(
      appBar: AppBar(
        title: Text("$name's Details"),
        backgroundColor: const Color(0xFF4A64F6),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile Header
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: const Color(0xFF4A64F6).withOpacity(0.1),
                shape: BoxShape.circle,
                border: Border.all(
                  color: const Color(0xFF4A64F6),
                  width: 3,
                ),
              ),
              child: Icon(
                Icons.person,
                size: 60,
                color: const Color(0xFF4A64F6),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1E2A4B),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              contactDetails["position"]!,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              contactDetails["company"]!,
              style: const TextStyle(
                fontSize: 16,
                color: Color(0xFF4A64F6),
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 32),

            // Contact Information Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Contact Information",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1E2A4B),
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildContactItem(
                    Icons.phone,
                    "Phone",
                    contactDetails["phone"]!,
                  ),
                  const SizedBox(height: 16),
                  _buildContactItem(
                    Icons.email,
                    "Email",
                    contactDetails["email"]!,
                  ),
                  const SizedBox(height: 16),
                  _buildContactItem(
                    Icons.location_on,
                    "Address",
                    contactDetails["address"]!,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Action Buttons
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Call functionality
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4A64F6),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    icon: const Icon(Icons.phone, size: 20),
                    label: const Text("Call"),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Message functionality
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(0xFF4A64F6),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: const BorderSide(color: Color(0xFF4A64F6)),
                      ),
                    ),
                    icon: const Icon(Icons.message, size: 20),
                    label: const Text("Message"),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  // Email functionality
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1E2A4B),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                icon: const Icon(Icons.email, size: 20),
                label: const Text("Send Email"),
              ),
            ),
            const SizedBox(height: 32),

            // Additional Information
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Additional Information",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1E2A4B),
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildInfoRow("Department", "Engineering"),
                  const SizedBox(height: 12),
                  _buildInfoRow("Status", "Active"),
                  const SizedBox(height: 12),
                  _buildInfoRow("Last Contact", "2 days ago"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactItem(IconData icon, String title, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          color: const Color(0xFF4A64F6),
          size: 24,
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF1E2A4B),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInfoRow(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color(0xFF1E2A4B),
          ),
        ),
      ],
    );
  }
}
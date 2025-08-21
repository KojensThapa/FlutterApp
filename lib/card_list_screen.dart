import 'package:flutter/material.dart';
import 'card_detail_screen.dart';
import 'settings_screen.dart';

class CardListScreen extends StatelessWidget {
  const CardListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> cards = [
      {"name": "John Doe", "phone": "+977-9812345678"},
      {"name": "Jane Smith", "phone": "+977-9801234567"},
      {"name": "Alex Johnson", "phone": "+977-9823456789"},
      {"name": "Sarah Williams", "phone": "+977-9834567890"},
      {"name": "Michael Brown", "phone": "+977-9845678901"},
      {"name": "Emily Davis", "phone": "+977-9856789012"},
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        title: const Text(
          "Visiting Cards",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFF4A64F6),
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, size: 24),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsScreen(),
                ),
              );
            },
          ),
        ],
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
            child: Text(
              "My Contacts",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1E2A4B),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: Text(
              "You have ${6} contact cards",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: cards.length,
              itemBuilder: (context, index) {
                final card = cards[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
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
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    leading: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color(0xFF4A64F6).withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.person,
                        color: const Color(0xFF4A64F6),
                        size: 28,
                      ),
                    ),
                    title: Text(
                      card["name"]!,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Color(0xFF1E2A4B),
                      ),
                    ),
                    subtitle: Text(
                      card["phone"]!,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                    trailing: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: const Color(0xFF4A64F6).withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.chevron_right,
                        color: const Color(0xFF4A64F6),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              CardDetailScreen(name: card["name"]!),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
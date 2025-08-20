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
    ];

    return Scaffold(
      backgroundColor: Colors.white, // ✅ CHANGED: set whole background to white
      appBar: AppBar(
        title: const Text("Visiting Cards"),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
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
      ),
      body: ListView.builder(
        itemCount: cards.length,
        itemBuilder: (context, index) {
          final card = cards[index];
          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              leading: const Icon(Icons.person, color: Colors.blue),
              title: Text(card["name"]!),
              subtitle: Text(card["phone"]!),
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
    );
  }
}

import 'package:flutter/material.dart';

class CardDetailScreen extends StatelessWidget {
  final String name;

  const CardDetailScreen({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("$name's Details")),
      body: Center(
        child: Text(
          "This is the detail page for $name",
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

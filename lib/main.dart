import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'card_list_screen.dart';
import 'card_detail_screen.dart';
import 'settings_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginScreen(),
      // Add named routes for navigation
      routes: {
        '/login': (context) => const LoginScreen(),
        '/cards': (context) => const CardListScreen(),
        '/settings': (context) => const SettingsScreen(),
      },
      // Optional: if you want to handle unknown routes
      onGenerateRoute: (settings) {
        // You can add custom route handling here if needed
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        );
      },
    );
  }
}
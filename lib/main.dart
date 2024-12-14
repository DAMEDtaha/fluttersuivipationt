import 'package:flutter/material.dart';
import 'screens/login_screen.dart';  // Prise en charge correcte

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});  // Utilisation correcte de super(key)

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const LoginScreen(),  // Le constructeur LoginScreen est appelé ici
    );
  }
}

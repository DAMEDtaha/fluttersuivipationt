import 'package:flutter/material.dart';
import 'package:logger/logger.dart';  // Ajout de la bibliothèque Logger

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);  // Super() utilisé ici

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  String _userRole = 'Patient'; // Valeur par défaut

  final logger = Logger();  // Instance de logger

  void _login() {
    final username = _usernameController.text;
    final password = _passwordController.text;

    // Exemple de validation et de connexion ici
    logger.i('Nom d\'Utilisateur: $username');
    logger.i('Mot de Passe: $password');
    logger.i('Rôle: $_userRole');
    // Ajoutez votre logique de vérification ici
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Connexion'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Nom d\'Utilisateur',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Mot de Passe',
                border: OutlineInputBorder(),
              ),
              obscureText: true, // Masquer le mot de passe
            ),
            SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: _userRole,
              onChanged: (String? newValue) {
                setState(() {
                  _userRole = newValue!;
                });
              },
              decoration: InputDecoration(
                labelText: 'Rôle',
                border: OutlineInputBorder(),
              ),
              items: <String>['Patient', 'Médecin', 'Admin']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              child: Text('Se Connecter'),
            ),
          ],
        ),
      ),
    );
  }
}

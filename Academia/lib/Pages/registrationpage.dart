import 'package:flutter/material.dart';

class RegistrationScreen extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _register(BuildContext context) {
    // Implement your registration logic here
    String username = usernameController.text;
    String password = passwordController.text;

    // Example validation and registration process
    if (username.isNotEmpty && password.isNotEmpty) {
      // Show success message and navigate to login screen
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Registration successful')),
      );
      Navigator.pop(context); // Go back to the login screen
    } else {
      // Show error message if username or password is empty
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter username and password')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () => _register(context),
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}

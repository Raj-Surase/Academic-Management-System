import 'package:academia/Pages/homepage.dart';
import 'package:academia/Pages/registrationpage.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _login(BuildContext context) {
    // Implement your login logic here
    String username = usernameController.text;
    String password = passwordController.text;

    // Example validation (replace with your authentication logic)
    if (username.isNotEmpty && password.isNotEmpty) {
      // Navigate to home screen after successful login
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen(username)),
      );
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
        title: Text('Login'),
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
              onPressed: () => _login(context),
              child: Text('Login'),
            ),
            SizedBox(height: 16.0),
            TextButton(
              onPressed: () {
                // Navigate to registration screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegistrationScreen()),
                );
              },
              child: Text('Create an account'),
            ),
          ],
        ),
      ),
    );
  }
}

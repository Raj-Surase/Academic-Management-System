import 'package:flutter/material.dart';

class SuggestionsPage extends StatefulWidget {
  @override
  _SuggestionsPageState createState() => _SuggestionsPageState();
}

class _SuggestionsPageState extends State<SuggestionsPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController suggestionController = TextEditingController();

  void _submitSuggestions() {
    // Process the submitted suggestions here
    String name = nameController.text;
    String suggestion = suggestionController.text;

    // Display a message thanking the user for their suggestions
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Thank You!'),
          content: Text('Thanks for your suggestions, $name!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
                Navigator.pop(context); // Close the SuggestionsPage
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Suggestions'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Your Name'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: suggestionController,
              decoration: InputDecoration(labelText: 'Your Suggestions'),
              maxLines: 5,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _submitSuggestions,
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}

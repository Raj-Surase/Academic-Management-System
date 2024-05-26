import 'package:flutter/material.dart';

class StaffPage extends StatelessWidget {
  final List<Map<String, String>> staffList = [
    {'name': 'John Doe', 'number': '123-456-7890', 'profile': 'Manager'},
    {
      'name': 'Jane Smith',
      'number': '987-654-3210',
      'profile': 'Assistant Manager'
    },
    {
      'name': 'Michael Johnson',
      'number': '555-555-5555',
      'profile': 'Supervisor'
    },
    {
      'name': 'Emily Williams',
      'number': '111-222-3333',
      'profile': 'Team Lead'
    },
    {'name': 'Robert Brown', 'number': '999-999-9999', 'profile': 'Developer'},
    {'name': 'Sarah Davis', 'number': '777-777-7777', 'profile': 'Designer'},
    {
      'name': 'Christopher Wilson',
      'number': '444-444-4444',
      'profile': 'Analyst'
    },
    {
      'name': 'Jessica Miller',
      'number': '666-666-6666',
      'profile': 'Coordinator'
    },
    {'name': 'David Martinez', 'number': '222-333-4444', 'profile': 'Engineer'},
    {
      'name': 'Michelle Anderson',
      'number': '888-888-8888',
      'profile': 'Consultant'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Staff Page'),
      ),
      body: ListView.builder(
        itemCount: staffList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(staffList[index]['name'] ?? ''),
            subtitle: Text(staffList[index]['profile'] ?? ''),
            trailing: Text(staffList[index]['number'] ?? ''),
          );
        },
      ),
    );
  }
}

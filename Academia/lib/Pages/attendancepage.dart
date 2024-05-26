import 'package:flutter/material.dart';

class AttendancePage extends StatefulWidget {
  @override
  _AttendancePageState createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  List<Student> students = List.generate(30, (index) => Student(index + 1));

  int presentCount = 0;
  int absentCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Attendance Page'),
      ),
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Roll No: ${students[index].rollNo}'),
            subtitle: Text('Name: ${students[index].name}'),
            onTap: () {
              setState(() {
                students[index].toggleAttendance();
              });
            },
            tileColor: students[index].isPresent ? Colors.green : null,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          presentCount = students.where((student) => student.isPresent).length;
          absentCount = students.length - presentCount;
          _showAttendanceSummary(context);
        },
        child: Icon(Icons.check),
      ),
    );
  }

  void _showAttendanceSummary(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Attendance Summary'),
          content: Text('Present: $presentCount\nAbsent: $absentCount'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
                Navigator.pop(context); // Close the attendance page
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

class Student {
  final int rollNo;
  final String name;
  final double? grade; // Making grade optional by using nullable type
  bool isPresent;

  Student(this.rollNo, {this.grade})
      : name = 'Student ${rollNo.toString().padLeft(2, '0')}',
        isPresent = false;

  void toggleAttendance() {
    isPresent = !isPresent;
  }
}

import 'package:academia/Pages/attendancepage.dart';
import 'package:academia/Pages/staffpage.dart';
import 'package:academia/Pages/studentlistpage.dart';
import 'package:academia/Pages/suggestionspage.dart';
import 'package:academia/Pages/timetable.dart';
import 'package:academia/Style/app_colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final String username;

  HomeScreen(this.username);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome, $username'),
        actions: [
          IconButton(
            onPressed: () {
              // Add profile button functionality here
            },
            icon: Icon(Icons.account_circle),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 5),
            child: GestureDetector(
              onTap: () {
                // Navigate to Time Table page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TimeTablePage()),
                );
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 80,
                decoration: BoxDecoration(
                    color: AppColors.surfaceBG,
                    borderRadius: BorderRadius.circular(12)),
                child: Center(
                    child: Text(
                  'Time Table',
                  style: TextStyle(
                      color: AppColors.textHi,
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                )),
              ),
            ),
          ),
          SizedBox(height: 10.0),
          GestureDetector(
            onTap: () {
              // Navigate to Attendance page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => StaffPage()),
              );
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 5, 24, 5),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 80,
                decoration: BoxDecoration(
                    color: AppColors.surfaceBG,
                    borderRadius: BorderRadius.circular(12)),
                child: Center(
                    child: Text(
                  'Staff',
                  style: TextStyle(
                      color: AppColors.textHi,
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                )),
              ),
            ),
          ),
          SizedBox(height: 10.0),
          GestureDetector(
            onTap: () {
              // Navigate to Attendance page
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => StudentGradeChart()));
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 5, 24, 5),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 80,
                decoration: BoxDecoration(
                    color: AppColors.surfaceBG,
                    borderRadius: BorderRadius.circular(12)),
                child: Center(
                    child: Text(
                  'Student Performance',
                  style: TextStyle(
                      color: AppColors.textHi,
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                )),
              ),
            ),
          ),
          SizedBox(height: 10.0),
          GestureDetector(
            onTap: () {
              // Navigate to Attendance page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AttendancePage()),
              );
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 5, 24, 5),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 80,
                decoration: BoxDecoration(
                    color: AppColors.surfaceBG,
                    borderRadius: BorderRadius.circular(12)),
                child: Center(
                    child: Text(
                  'Attendance',
                  style: TextStyle(
                      color: AppColors.textHi,
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                )),
              ),
            ),
          ),
          // Add similar GestureDetector containers for other sections
          SizedBox(height: 10.0),
          GestureDetector(
            onTap: () {
              // Navigate to Attendance page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SuggestionsPage()),
              );
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 5, 24, 5),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 80,
                decoration: BoxDecoration(
                    color: AppColors.surfaceBG,
                    borderRadius: BorderRadius.circular(12)),
                child: Center(
                    child: Text(
                  'Suggestions',
                  style: TextStyle(
                      color: AppColors.textHi,
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

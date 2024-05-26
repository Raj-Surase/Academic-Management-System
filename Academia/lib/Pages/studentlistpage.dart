import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class Student {
  final String name;
  final double? grade;

  Student({required this.name, this.grade});
}

class StudentGradeChart extends StatelessWidget {
  final List<Student> dummyStudents = [
    Student(name: 'John Doe', grade: 85.0),
    Student(name: 'Jane Smith', grade: 70.0),
    Student(name: 'Alice Johnson', grade: 55.0),
    // Add more dummy entries here
  ];

  Map<String, double> _createGradeData() {
    int goodCount = dummyStudents
        .where((student) => student.grade != null && student.grade! >= 80.0)
        .length;
    int averageCount = dummyStudents
        .where((student) =>
            student.grade != null &&
            student.grade! >= 60.0 &&
            student.grade! < 80.0)
        .length;
    int poorCount = dummyStudents
        .where((student) => student.grade != null && student.grade! < 60.0)
        .length;

    return {
      'Good': goodCount.toDouble(),
      'Average': averageCount.toDouble(),
      'Poor': poorCount.toDouble(),
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grade Distribution'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PieChart(
                dataMap: _createGradeData(),
                chartType: ChartType.ring,
                chartRadius: MediaQuery.of(context).size.width / 3,
                ringStrokeWidth: 32,
                centerText: 'Grade Distribution',
              ),
              SizedBox(height: 20.0),
              Text(
                'Student Grade Distribution',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

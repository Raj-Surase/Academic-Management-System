import 'package:academia/Style/app_colors.dart';
import 'package:flutter/material.dart';

class TimeTablePage extends StatefulWidget {
  @override
  _TimeTablePageState createState() => _TimeTablePageState();
}

class _TimeTablePageState extends State<TimeTablePage> {
  PageController _pageController = PageController();
  int _currentPage = 0;
  List<Map<String, String>> timetable = [];
  List<String> daysOfWeek = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];

  final TextEditingController subjectController = TextEditingController();
  String selectedDay = 'Monday';
  String selectedTime = '9:00 AM - 10:30 AM';

  void _addOrUpdateTimetable() {
    String subject = subjectController.text;

    if (subject.isNotEmpty) {
      bool updated = false;
      for (int i = 0; i < timetable.length; i++) {
        if (timetable[i]['day'] == selectedDay) {
          // Update existing entry
          timetable[i]['subject'] = subject;
          timetable[i]['time'] = selectedTime;
          updated = true;
          break;
        }
      }
      if (!updated) {
        // Add new entry
        timetable.add({
          'week': 'Week ${_currentPage + 1}',
          'day': selectedDay,
          'subject': subject,
          'time': selectedTime
        });
      }

      // Clear text field
      subjectController.clear();

      // Update UI
      setState(() {});
    } else {
      ScaffoldMessenger.of(context).removeCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter subject')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Time Table'),
      ),
      body: Column(
        children: [
          DropdownButton<String>(
            value: selectedDay,
            items: daysOfWeek.map((String day) {
              return DropdownMenuItem<String>(
                value: day,
                child: Text(day),
              );
            }).toList(),
            onChanged: (String? value) {
              setState(() {
                selectedDay = value!;
              });
            },
          ),
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: daysOfWeek.length,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                  selectedDay = daysOfWeek[index];
                });
              },
              itemBuilder: (context, index) {
                return _buildDayPage(index);
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return AddSubjectForm(
                    timetable: timetable,
                    addOrUpdateTimetable: _addOrUpdateTimetable,
                    daysOfWeek: daysOfWeek, // Pass daysOfWeek here
                  );
                },
              );
            },
            child: Text('Add Subject'),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPage,
        items: daysOfWeek.map((day) {
          return BottomNavigationBarItem(
            label: day,
            backgroundColor: AppColors.surfaceFG,
            icon: Icon(
              Icons.event,
            ),
          );
        }).toList(),
        onTap: (index) {
          _pageController.animateToPage(
            index,
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        },
      ),
    );
  }

  Widget _buildDayPage(int index) {
    List<Map<String, String>> dayList =
        timetable.where((entry) => entry['day'] == daysOfWeek[index]).toList();

    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Day: ${daysOfWeek[index]}',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
          ),
          SizedBox(height: 10.0),
          ListView.builder(
            shrinkWrap: true,
            itemCount: dayList.length,
            itemBuilder: (context, idx) {
              return ListTile(
                title: Text('Subject: ${dayList[idx]['subject']}'),
                subtitle: Text('Time: ${dayList[idx]['time']}'),
              );
            },
          ),
        ],
      ),
    );
  }
}

class AddSubjectForm extends StatefulWidget {
  final List<Map<String, String>> timetable;
  final Function addOrUpdateTimetable;
  final List<String> daysOfWeek; // Add daysOfWeek here

  AddSubjectForm({
    required this.timetable,
    required this.addOrUpdateTimetable,
    required this.daysOfWeek,
  });

  @override
  _AddSubjectFormState createState() => _AddSubjectFormState();
}

class _AddSubjectFormState extends State<AddSubjectForm> {
  final TextEditingController subjectController = TextEditingController();
  String selectedTime = '9:00 AM - 10:30 AM';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          DropdownButtonFormField<String>(
            value: selectedTime,
            items: <String>[
              '9:00 AM - 10:30 AM',
              '10:00 AM - 11:30 AM',
              '11:00 AM - 12:30 PM',
              '1:00 PM - 2:30 PM',
              '3:00 PM - 4:30 PM'
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectedTime = value!;
              });
            },
            decoration: InputDecoration(labelText: 'Time'),
          ),
          SizedBox(height: 16.0),
          DropdownButtonFormField<String>(
            value: widget.daysOfWeek[0], // Set default value
            items: widget.daysOfWeek.map((String day) {
              return DropdownMenuItem<String>(
                value: day,
                child: Text(day),
              );
            }).toList(),
            onChanged: (value) {
              // Update selectedDay in parent widget
              widget.addOrUpdateTimetable();
              Navigator.pop(context);
            },
            decoration: InputDecoration(labelText: 'Day'),
          ),
          SizedBox(height: 16.0),
          TextField(
            controller: subjectController,
            decoration: InputDecoration(labelText: 'Subject'),
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              widget.addOrUpdateTimetable();
              Navigator.pop(context);
            },
            child: Text('Save'),
          ),
        ],
      ),
    );
  }
}

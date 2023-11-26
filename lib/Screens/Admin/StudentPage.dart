import 'package:chatizeck1/globals.dart';
import 'package:chatizeck1/main.dart';
import 'package:flutter/material.dart';

class StudentPage extends StatefulWidget {
      final int classIndex;
      final int subjectIndex;
      final int testIndex;
      final int studentIndex;
      final VoidCallback onStudentRemoved;

      StudentPage({
        super.key,
        required this.classIndex,
        required this.subjectIndex,
        required this.testIndex,
        required this.studentIndex,
        required this.onStudentRemoved,
      });

      @override
      _StudentPageState createState() => _StudentPageState();
    }

class _StudentPageState extends State<StudentPage> {
      TextEditingController marksController = TextEditingController();

      @override
      Widget build(BuildContext context) {
        Class currentClass = GlobalData.classes[widget.classIndex];
        Subject currentSubject = currentClass.subjects[widget.subjectIndex];
        Test currentTest = currentSubject.tests[widget.testIndex];
        Student currentStudent = currentTest.students[widget.studentIndex];

        return Scaffold(
          appBar: AppBar(
            title: Text('Student Details'),
            backgroundColor: Colors.blue,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Student: ${currentStudent.name}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Marks Obtained: ${currentStudent.marksObtained}',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    controller: marksController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: 'Enter Marks'),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      String marks = marksController.text.trim();
                      if (marks.isNotEmpty) {
                        int marksObtained = int.parse(marks);
                        // Add a check for valid marks
                        if (marksObtained >= 0 &&
                            marksObtained <= currentTest.totalMarks) {
                          setState(() {
                            currentStudent.marksObtained = marksObtained;
                          });
                        } else {
                          // Show an error message or handle invalid marks
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('Invalid Marks'),
                                content: Text(
                                    'Marks should be between 0 and ${currentTest.totalMarks}.'),
                                actions: [
                                  ElevatedButton(
                                    onPressed: () {
                                      widget.onStudentRemoved();
                                      Navigator.pop(context);
                                    },
                                    child: Text('OK'),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      }
                    },
                    child: Text('Save Marks'),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    }
  
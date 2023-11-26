import 'package:chatizeck1/main.dart';
import 'package:flutter/material.dart';


class CreateStudentPage extends StatefulWidget {
      final int classIndex;
      final int subjectIndex;
      final int testIndex;
      final void Function(String, int) onStudentCreated;

      CreateStudentPage({
        super.key,
        required this.classIndex,
        required this.subjectIndex,
        required this.testIndex,
        required this.onStudentCreated,
      });

      @override
      _CreateStudentPageState createState() => _CreateStudentPageState();
    }

class _CreateStudentPageState extends State<CreateStudentPage> {
      TextEditingController studentNameController = TextEditingController();
      TextEditingController marksController = TextEditingController();

      @override
      Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Add Student'),
            backgroundColor: Colors.blue,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    controller: studentNameController,
                    decoration: InputDecoration(labelText: 'Enter Student Name'),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    controller: marksController,
                    decoration: InputDecoration(labelText: 'Enter Marks'),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      String studentName = studentNameController.text.trim();
                      String marksText = marksController.text.trim();

                      if (studentName.isNotEmpty && marksText.isNotEmpty) {
                        int marks = int.parse(marksText);

                        // Check if marks are within the total marks range
                        if (marks >= 0 &&
                            marks <=
                                GlobalData.classes[widget.classIndex]
                                    .subjects[widget.subjectIndex]
                                    .tests[widget.testIndex]
                                    .totalMarks) {
                          widget.onStudentCreated(studentName, marks);
                          Navigator.pop(context);
                        } else {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text('Error'),
                              content: Text(
                                  'Invalid marks. Marks should be between 0 and '
                                  '${GlobalData.classes[widget.classIndex].subjects[widget.subjectIndex].tests[widget.testIndex].totalMarks}.'),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text('OK'),
                                ),
                              ],
                            ),
                          );
                        }
                      } else {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Error'),
                            content: Text('Both fields are required.'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text('OK'),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                    child: Text('Add Student'),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    }

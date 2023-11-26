import 'package:chatizeck1/globals.dart';
import 'package:chatizeck1/main.dart';
import 'package:flutter/material.dart';

class ReadOnlyEnterMarksPage extends StatefulWidget {
  final int classIndex;
  final int subjectIndex;
  final int testIndex;

  ReadOnlyEnterMarksPage({super.key, required this.classIndex, required this.subjectIndex, required this.testIndex});

  @override
  _ReadOnlyEnterMarksPageState createState() => _ReadOnlyEnterMarksPageState();
}

class _ReadOnlyEnterMarksPageState extends State<ReadOnlyEnterMarksPage> {
  Test selectedTest = Test(name: '', totalMarks: 0, students: []); // Updated

  @override
  void initState() {
    super.initState();
    selectedTest = GlobalData.classes[widget.classIndex].subjects[widget.subjectIndex].tests[widget.testIndex];
  }

  @override
  Widget build(BuildContext context) {
    List<Student> students = selectedTest.students;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Marks Details',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Test: ${selectedTest.name}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text(
                'Students and Marks:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.all(8.0),
                  margin: EdgeInsets.symmetric(vertical: 8.0),
                  child: DataTable(
                    columns: [
                      DataColumn(label: Text('Student Name')),
                      DataColumn(label: Text('Obtained Marks')),
                      DataColumn(label: Text('Out of Marks')),
                    ],
                    rows: students.map((student) {
                      return DataRow(cells: [
                        DataCell(Text(student.name)),
                        DataCell(Text(student.marksObtained.toString())),
                        DataCell(Text(selectedTest.totalMarks.toString())),
                      ]);
                    }).toList(),
                  ),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Back'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  side: BorderSide(color: Colors.blue, width: 2),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

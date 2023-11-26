import 'package:chatizeck1/Screens/Admin/CreateData/CreateStudentPage.dart';
import 'package:chatizeck1/Screens/Admin/StudentPage.dart';
import 'package:chatizeck1/globals.dart';
import 'package:chatizeck1/main.dart';
import 'package:flutter/material.dart';


class TestPage extends StatefulWidget {
  final int classIndex;
  final int subjectIndex;
  final int testIndex;
  final void Function(String) onStudentCreated;
  final VoidCallback onTestRemoved;

  TestPage({super.key, 
    required this.classIndex,
    required this.subjectIndex,
    required this.testIndex,
    required this.onStudentCreated,
    required this.onTestRemoved,
    });

    @override
    _TestPageState createState() => _TestPageState();

    }

class _TestPageState extends State<TestPage> {
  void refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Class currentClass = GlobalData.classes[widget.classIndex];
    Subject currentSubject = currentClass.subjects[widget.subjectIndex];
    Test currentTest = currentSubject.tests[widget.testIndex];

    void removeTest() {
      setState(() {
        currentSubject.tests.removeAt(widget.testIndex);
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(currentTest.name),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: currentTest.students.length,
              itemBuilder: (context, studentIndex) {
                String studentName = currentTest.students[studentIndex].name;
                return Container(
                  margin: EdgeInsets.all(8.0),
                  padding: EdgeInsets.all(2.0),
                  child: ListTile(
                    title: Text(studentName),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        refresh();
                        setState(() {
                          currentTest.students.removeAt(studentIndex);
                          GlobalData.classes[widget.classIndex]
                              .subjects[widget.subjectIndex]
                              .tests[widget.testIndex]
                              .students
                              .removeAt(studentIndex);
                          refresh();
                        });
                        refresh();
                      },
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StudentPage(
                            classIndex: widget.classIndex,
                            subjectIndex: widget.subjectIndex,
                            testIndex: widget.testIndex,
                            studentIndex: studentIndex,
                            onStudentRemoved: refresh,
                          ),
                        ),
                      );
                    },
                    // BEGIN: 2a3b4c5d6e7f
                    tileColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                    hoverColor: Colors.grey.withOpacity(0.5),
                    contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    // END: 2a3b4c5d6e7f
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () async {
              String? studentName = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CreateStudentPage(
                    classIndex: widget.classIndex,
                    subjectIndex: widget.subjectIndex,
                    testIndex: widget.testIndex,
                    onStudentCreated: (String studentName, int marks) {
                      setState(() {
                        currentTest.students.add(
                          Student(
                            name: studentName,
                            marksObtained: marks,
                          ),
                        );
                      });
                    },
                  ),
                ),
              );

              if (studentName != null) {
                widget.onStudentCreated(studentName);
              }
            },
            child: Icon(Icons.add),
          ),
          SizedBox(height: 16),
          FloatingActionButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Remove Test'),
                  content: Text('Are you sure you want to remove this test?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        removeTest();
                        widget.onTestRemoved();
                        Navigator.pop(context);
                      },
                      child: Text('Remove'),
                    ),
                  ],
                ),
              );
            },
            child: Icon(Icons.delete),
          ),
        ],
      ),
    );
  }
}

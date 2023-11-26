import 'package:chatizeck1/Screens/Admin/CreateData/CreateTestPage.dart';
import 'package:chatizeck1/Screens/Admin/TestPage.dart';
import 'package:chatizeck1/globals.dart';
import 'package:chatizeck1/main.dart';
import 'package:flutter/material.dart';


class SubjectPage extends StatefulWidget {
          final int classIndex;
          final int subjectIndex;
          final Function(String) onTestCreated;
          final VoidCallback onSubjectRemoved;

          SubjectPage({
            super.key,
            required this.classIndex,
            required this.subjectIndex,
            required this.onTestCreated, 
            required this.onSubjectRemoved,
          });

          @override
          _SubjectPageState createState() => _SubjectPageState();
        }

class _SubjectPageState extends State<SubjectPage> {
  void refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Class currentClass = GlobalData.classes[widget.classIndex];
    Subject currentSubject = currentClass.subjects[widget.subjectIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text(currentSubject.name),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: currentSubject.tests.length,
          itemBuilder: (context, testIndex) {
            String testName = currentSubject.tests[testIndex].name;
            return Container(
              margin: EdgeInsets.all(8.0),
              padding: EdgeInsets.all(2.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: ListTile(
                title: Text(testName),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TestPage(
                        classIndex: widget.classIndex,
                        subjectIndex: widget.subjectIndex,
                        testIndex: testIndex,
                        onStudentCreated: (String studentName) {
                          setState(() {
                            currentSubject.tests[testIndex].students.add(
                              Student(
                                name: studentName,
                                marksObtained: 0, // Set your default value
                              ),
                            );
                          });
                        },
                        onTestRemoved: refresh,
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          String? testName = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreateTestPage(
                onTestCreated: (String testName, int totalMarks) {
                  setState(() {
                    currentSubject.tests.add(Test(
                      name: testName,
                      totalMarks: totalMarks,
                      students: [],
                    ));
                  });
                },
              ),
            ),
          );

          // No need to check testName for null, as it's handled in CreateTestPage
        },
        child: Icon(Icons.add),
      ),
      persistentFooterButtons: [
        ElevatedButton(
          onPressed: () {
            setState(() {
              GlobalData.classes[widget.classIndex].subjects.removeAt(widget.subjectIndex);
            });
            widget.onSubjectRemoved();
            Navigator.pop(context);
          },
          child: Text('Delete Subject'),
        ),
      ],
    );
  }
}

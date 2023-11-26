import 'package:chatizeck1/Screens/Admin/CreateData/CreateSubjectPage.dart';
import 'package:chatizeck1/Screens/Admin/SubjectPage.dart';
import 'package:chatizeck1/globals.dart';
import 'package:chatizeck1/main.dart';
import 'package:flutter/material.dart';


class ClassPage extends StatefulWidget {
          final int classIndex;
          final VoidCallback onClassRemoved;

          ClassPage({super.key, required this.classIndex, required this.onClassRemoved});

          @override
          _ClassPageState createState() => _ClassPageState();
        }

class _ClassPageState extends State<ClassPage> {
  void refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Class currentClass = GlobalData.classes[widget.classIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text(currentClass.name),
        backgroundColor: Colors.blue,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              setState(() {
                GlobalData.classes.removeAt(widget.classIndex);
              });
              widget.onClassRemoved();
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: currentClass.subjects.length,
          itemBuilder: (context, subjectIndex) {
            String subjectName = currentClass.subjects[subjectIndex].name;
            return Container(
              margin: EdgeInsets.all(8.0),
              padding: EdgeInsets.all(2.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: ListTile(
                title: Text(subjectName),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SubjectPage(
                        classIndex: widget.classIndex,
                        subjectIndex: subjectIndex,
                        onTestCreated: (String testName) {
                          setState(() {
                            currentClass.subjects[subjectIndex].tests.add(Test(
                              name: testName,
                              totalMarks: 100, // Set your default value
                              students: [],
                            ));
                          });
                        },
                        onSubjectRemoved: refresh,
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
          String? subjectName = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreateSubjectPage(
                onSubjectCreated: (String subjectName) {
                  setState(() {
                    currentClass.subjects.add(Subject(
                      name: subjectName,
                      tests: [],
                    ));
                  });
                },
              ),
            ),
          );

          // No need to check subjectName for null, as it's handled in CreateSubjectPage
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

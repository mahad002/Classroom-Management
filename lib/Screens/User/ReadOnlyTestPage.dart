import 'package:chatizeck1/Screens/User/ReadOnlyStudentPage.dart';
import 'package:chatizeck1/main.dart';
import 'package:flutter/material.dart';


class ReadOnlyTestsPage extends StatefulWidget {
  final int classIndex;
  final int subjectIndex;

  ReadOnlyTestsPage({super.key, required this.classIndex, required this.subjectIndex});

  @override
  _ReadOnlyTestsPageState createState() => _ReadOnlyTestsPageState();
}

class _ReadOnlyTestsPageState extends State<ReadOnlyTestsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          GlobalData.classes[widget.classIndex].subjects[widget.subjectIndex].name,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: GlobalData.classes[widget.classIndex].subjects[widget.subjectIndex].tests.length,
          itemBuilder: (context, testIndex) {
            String testName =
                GlobalData.classes[widget.classIndex].subjects[widget.subjectIndex].tests[testIndex].name;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  title: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      testName,
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ReadOnlyEnterMarksPage(
                          classIndex: widget.classIndex,
                          subjectIndex: widget.subjectIndex,
                          testIndex: testIndex,
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

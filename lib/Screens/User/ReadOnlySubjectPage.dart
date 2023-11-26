import 'package:chatizeck1/Screens/User/ReadOnlyTestPage.dart';
import 'package:chatizeck1/main.dart';
import 'package:flutter/material.dart';

class ReadOnlySubjectPage extends StatefulWidget {
  final int classIndex;

  ReadOnlySubjectPage({super.key, required this.classIndex});

  @override
  _ReadOnlySubjectPageState createState() => _ReadOnlySubjectPageState();
}

class _ReadOnlySubjectPageState extends State<ReadOnlySubjectPage> {
  @override
  Widget build(BuildContext context) {
    print(GlobalData.classes);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          GlobalData.classes[widget.classIndex].name,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: GlobalData.classes[widget.classIndex].subjects.length,
          itemBuilder: (context, subjectIndex) {
            String subjectName =
                GlobalData.classes[widget.classIndex].subjects[subjectIndex].name;
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
                  title: Text(
                    subjectName,
                    style: TextStyle(fontSize: 18),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ReadOnlyTestsPage(
                          classIndex: widget.classIndex,
                          subjectIndex: subjectIndex,
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

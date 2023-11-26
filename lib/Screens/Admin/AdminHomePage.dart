import 'package:chatizeck1/Screens/Admin/ClassPage.dart';
import 'package:chatizeck1/Screens/Admin/CreateData/CreateClassPage.dart';
import 'package:chatizeck1/globals.dart';
import 'package:chatizeck1/main.dart';
import 'package:flutter/material.dart';

class AdminHomePage extends StatefulWidget {
  final List<Class> classes;
  final void Function(List<Class>) onClassesUpdated;
  final VoidCallback reload;

  AdminHomePage({super.key, required this.classes, required this.onClassesUpdated, required this.reload});

  @override
  _AdminHomePageState createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  @override
  Widget build(BuildContext context) {
    void refresh() {
      setState(() {});
    }
    print(widget.classes);
    return Scaffold(
      appBar: AppBar( 
        title: Text('Admin Page'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            widget.reload();
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: GlobalData.classes.length,
        itemBuilder: (context, classIndex) {
          String className = GlobalData.classes[classIndex].name;
          return Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(10),
            ),
            margin: EdgeInsets.all(8),
            padding: EdgeInsets.all(2),
            child: ListTile(
              title: Text(className),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ClassPage(classIndex: classIndex, onClassRemoved: refresh),
                  ),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          String? className = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreateClassPage(
                onClassCreated: (String className) {
                  setState(() {
                    GlobalData.classes.add(Class(name: className, subjects: []));
                    widget.classes.add(Class(name: className, subjects: []));
                    // widget.classes[] = GlobalData.classes[];
                    widget.onClassesUpdated(widget.classes);
                  });
                },
              ),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

import 'package:chatizeck1/Screens/User/ReadOnlySubjectPage.dart';
import 'package:chatizeck1/globals.dart';
import 'package:chatizeck1/main.dart';
import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  final List<Class> classes;

  UserPage({super.key, required this.classes});

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Page'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: GlobalData.classes.length,
          itemBuilder: (context, classIndex) {
            String className = GlobalData.classes[classIndex].name;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Column(
                children: [
                   //SizedBox(height: 16),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromARGB(255, 6, 16, 24),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      title: Text(className),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ReadOnlySubjectPage(
                              classIndex: classIndex,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  // SizedBox(height: 16), // Add a SizedBox after each ListTile
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

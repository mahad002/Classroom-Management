import 'package:chatizeck1/Screens/Admin/AdminHomePage.dart';
import 'package:chatizeck1/Screens/User/UserPage.dart';
import 'package:chatizeck1/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Class> classes = [];
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void refresh() {
      setState(() {
        nameController.text = '';
        passwordController.text = '';
      });
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Results App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                    ),
                    child: TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        labelText: 'Name',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                    ),
                    child: TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 94, 160, 236), // Change the color to your desired color
              ),
              onPressed: () {
                String name = nameController.text.trim();
                String password = passwordController.text.trim();

                if (name == 'Admin' && password == 'Admin123') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                    builder: (context) => AdminHomePage(
                      classes: classes,
                      onClassesUpdated: (updatedClasses) {
                        setState(() {
                          classes = updatedClasses;
                        });
                      }, reload: refresh,
                    ),
                  ),
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Not an admin'),
                      content: Text('You are not an admin. Please select the User button to continue as a user.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('OK'),
                        ),
                      ],
                    ),
                  );
                }
              },
              child: Text('Admin Login'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserPage(
                      classes: classes, // Pass the classes list
                    ),
                  ),
                );
              },
              child: Text('Check Results'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => SystemNavigator.pop(),
              child: Text('Exit'),
            ),
          ],
        ),
      ),
    );
  }
}

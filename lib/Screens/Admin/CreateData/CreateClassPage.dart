import 'package:chatizeck1/globals.dart';
import 'package:chatizeck1/main.dart';
import 'package:flutter/material.dart';

class CreateClassPage extends StatefulWidget {
  final Function(String) onClassCreated;

  CreateClassPage({super.key, required this.onClassCreated});

  @override
  _CreateClassPageState createState() => _CreateClassPageState();
}

class _CreateClassPageState extends State<CreateClassPage> {
  TextEditingController classController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Class'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: classController,
                decoration: InputDecoration(labelText: 'Enter Class Name'),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  String className = classController.text.trim();
                  if (className.isNotEmpty) {
                    widget.onClassCreated(className);
                    Navigator.pop(context);
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Error'),
                        content: Text('Class name is required.'),
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
                child: Text('Create Class'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CreateSubjectPage extends StatefulWidget {
          final Function(String) onSubjectCreated;

          CreateSubjectPage({super.key, required this.onSubjectCreated});

          @override
          _CreateSubjectPageState createState() => _CreateSubjectPageState();
        }

class _CreateSubjectPageState extends State<CreateSubjectPage> {
          TextEditingController subjectController = TextEditingController();

          @override
          Widget build(BuildContext context) {
            return Scaffold(
              appBar: AppBar(
                title: Text('Create Subject'),
                backgroundColor: Colors.blue,
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      TextField(
                        controller: subjectController,
                        decoration: InputDecoration(labelText: 'Enter Subject'),
                      ),
                      SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          String subjectName = subjectController.text.trim();
                          if (subjectName.isNotEmpty) {
                            widget.onSubjectCreated(subjectName);
                            Navigator.pop(context);
                          } else {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text('Error'),
                                content: Text('Subject name is required.'),
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
                        child: Text('Create Subject'),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        }

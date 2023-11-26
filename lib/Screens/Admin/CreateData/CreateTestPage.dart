import 'package:flutter/material.dart';

class CreateTestPage extends StatefulWidget {
          final Function(String, int) onTestCreated; // Updated

          CreateTestPage({super.key, required this.onTestCreated});

          @override
          _CreateTestPageState createState() => _CreateTestPageState();
        }

class _CreateTestPageState extends State<CreateTestPage> {
          TextEditingController testNameController = TextEditingController();
          TextEditingController totalMarksController = TextEditingController();

          @override
          Widget build(BuildContext context) {
            return Scaffold(
              appBar: AppBar(
                title: Text('Create Test'),
                backgroundColor: Colors.blue,
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      TextField(
                        controller: testNameController,
                        decoration: InputDecoration(labelText: 'Enter Test Name'),
                      ),
                      SizedBox(height: 16),
                      TextField(
                        controller: totalMarksController,
                        decoration: InputDecoration(labelText: 'Enter Total Marks'),
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          String testName = testNameController.text.trim();
                          String totalMarks = totalMarksController.text.trim();
                          if (testName.isNotEmpty && totalMarks.isNotEmpty) {
                            widget.onTestCreated(testName, int.parse(totalMarks)); // Updated
                            Navigator.pop(context);
                          } else {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text('Error'),
                                content: Text('Both fields are required.'),
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
                        child: Text('Create Test'),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        }

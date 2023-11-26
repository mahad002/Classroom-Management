import 'package:flutter/services.dart';

import 'globals.dart'; // Import the globals.dart file
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class GlobalData {
  static List<Class> classes = [];
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Create some sample data
    Class classA = Class(name: 'Class A', subjects: []);
    classA.subjects.add(Subject(name: 'Math', tests: []));
    classA.subjects.add(Subject(name: 'Science', tests: []));
    classA.subjects.add(Subject(name: 'English', tests: []));
    classA.subjects.add(Subject(name: 'History', tests: []));

    for (int i = 0; i < classA.subjects.length; i++) {
      for (int j = 0; j < 5; j++) {
        classA.subjects[i].tests.add(Test(name: 'Test ${j + 1}', totalMarks: 100, students: []));
      }
    }

    for (int i = 0; i < classA.subjects.length; i++) {
      for (int j = 0; j < classA.subjects[i].tests.length; j++) {
        for (int k = 0; k < 20; k++) {
          classA.subjects[i].tests[j].students.add(Student(name: 'Student ${k + 1}', marksObtained: 0));
        }
      }
    }

    Class classB = Class(name: 'Class B', subjects: []);
    classB.subjects.add(Subject(name: 'Math', tests: []));
    classB.subjects.add(Subject(name: 'Science', tests: []));
    classB.subjects.add(Subject(name: 'English', tests: []));
    classB.subjects.add(Subject(name: 'History', tests: []));

    for (int i = 0; i < classB.subjects.length; i++) {
      for (int j = 0; j < 5; j++) {
        classB.subjects[i].tests.add(Test(name: 'Test ${j + 1}', totalMarks: 100, students: []));
      }
    }

    for (int i = 0; i < classB.subjects.length; i++) {
      for (int j = 0; j < classB.subjects[i].tests.length; j++) {
        for (int k = 0; k < 20; k++) {
          classB.subjects[i].tests[j].students.add(Student(name: 'Student ${k + 1}', marksObtained: 0));
        }
      }
    }

    Class classC = Class(name: 'Class C', subjects: []);
    classC.subjects.add(Subject(name: 'Math', tests: []));
    classC.subjects.add(Subject(name: 'Science', tests: []));
    classC.subjects.add(Subject(name: 'English', tests: []));
    classC.subjects.add(Subject(name: 'History', tests: []));

    for (int i = 0; i < classC.subjects.length; i++) {
      for (int j = 0; j < 5; j++) {
        classC.subjects[i].tests.add(Test(name: 'Test ${j + 1}', totalMarks: 100, students: []));
      }
    }

    for (int i = 0; i < classC.subjects.length; i++) {
      for (int j = 0; j < classC.subjects[i].tests.length; j++) {
        for (int k = 0; k < 20; k++) {
          classC.subjects[i].tests[j].students.add(Student(name: 'Student ${k + 1}', marksObtained: 0));
        }
      }
    }

    Class classD = Class(name: 'Class D', subjects: []);
    classD.subjects.add(Subject(name: 'Math', tests: []));
    classD.subjects.add(Subject(name: 'Science', tests: []));
    classD.subjects.add(Subject(name: 'English', tests: []));
    classD.subjects.add(Subject(name: 'History', tests: []));

    for (int i = 0; i < classD.subjects.length; i++) {
      for (int j = 0; j < 5; j++) {
        classD.subjects[i].tests.add(Test(name: 'Test ${j + 1}', totalMarks: 100, students: []));
      }
    }

    for (int i = 0; i < classD.subjects.length; i++) {
      for (int j = 0; j < classD.subjects[i].tests.length; j++) {
        for (int k = 0; k < 20; k++) {
          classD.subjects[i].tests[j].students.add(Student(name: 'Student ${k + 1}', marksObtained: 0));
        }
      }
    }

    GlobalData.classes = [classA, classB, classC, classD];

    return MaterialApp(
      title: 'Results App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

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

class TestPage extends StatefulWidget {
  final int classIndex;
  final int subjectIndex;
  final int testIndex;
  final void Function(String) onStudentCreated;
  final VoidCallback onTestRemoved;

  TestPage({super.key, 
    required this.classIndex,
    required this.subjectIndex,
    required this.testIndex,
    required this.onStudentCreated,
    required this.onTestRemoved,
    });

    @override
    _TestPageState createState() => _TestPageState();

    }

class _TestPageState extends State<TestPage> {
  void refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Class currentClass = GlobalData.classes[widget.classIndex];
    Subject currentSubject = currentClass.subjects[widget.subjectIndex];
    Test currentTest = currentSubject.tests[widget.testIndex];

    void removeTest() {
      setState(() {
        currentSubject.tests.removeAt(widget.testIndex);
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(currentTest.name),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: currentTest.students.length,
              itemBuilder: (context, studentIndex) {
                String studentName = currentTest.students[studentIndex].name;
                return Container(
                  margin: EdgeInsets.all(8.0),
                  padding: EdgeInsets.all(2.0),
                  child: ListTile(
                    title: Text(studentName),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        refresh();
                        setState(() {
                          currentTest.students.removeAt(studentIndex);
                          GlobalData.classes[widget.classIndex]
                              .subjects[widget.subjectIndex]
                              .tests[widget.testIndex]
                              .students
                              .removeAt(studentIndex);
                          refresh();
                        });
                        refresh();
                      },
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StudentPage(
                            classIndex: widget.classIndex,
                            subjectIndex: widget.subjectIndex,
                            testIndex: widget.testIndex,
                            studentIndex: studentIndex,
                            onStudentRemoved: refresh,
                          ),
                        ),
                      );
                    },
                    // BEGIN: 2a3b4c5d6e7f
                    tileColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                    hoverColor: Colors.grey.withOpacity(0.5),
                    contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    // END: 2a3b4c5d6e7f
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () async {
              String? studentName = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CreateStudentPage(
                    classIndex: widget.classIndex,
                    subjectIndex: widget.subjectIndex,
                    testIndex: widget.testIndex,
                    onStudentCreated: (String studentName, int marks) {
                      setState(() {
                        currentTest.students.add(
                          Student(
                            name: studentName,
                            marksObtained: marks,
                          ),
                        );
                      });
                    },
                  ),
                ),
              );

              if (studentName != null) {
                widget.onStudentCreated(studentName);
              }
            },
            child: Icon(Icons.add),
          ),
          SizedBox(height: 16),
          FloatingActionButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Remove Test'),
                  content: Text('Are you sure you want to remove this test?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        removeTest();
                        widget.onTestRemoved();
                        Navigator.pop(context);
                      },
                      child: Text('Remove'),
                    ),
                  ],
                ),
              );
            },
            child: Icon(Icons.delete),
          ),
        ],
      ),
    );
  }
}

class CreateStudentPage extends StatefulWidget {
      final int classIndex;
      final int subjectIndex;
      final int testIndex;
      final void Function(String, int) onStudentCreated;

      CreateStudentPage({
        super.key,
        required this.classIndex,
        required this.subjectIndex,
        required this.testIndex,
        required this.onStudentCreated,
      });

      @override
      _CreateStudentPageState createState() => _CreateStudentPageState();
    }

class _CreateStudentPageState extends State<CreateStudentPage> {
      TextEditingController studentNameController = TextEditingController();
      TextEditingController marksController = TextEditingController();

      @override
      Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Add Student'),
            backgroundColor: Colors.blue,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    controller: studentNameController,
                    decoration: InputDecoration(labelText: 'Enter Student Name'),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    controller: marksController,
                    decoration: InputDecoration(labelText: 'Enter Marks'),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      String studentName = studentNameController.text.trim();
                      String marksText = marksController.text.trim();

                      if (studentName.isNotEmpty && marksText.isNotEmpty) {
                        int marks = int.parse(marksText);

                        // Check if marks are within the total marks range
                        if (marks >= 0 &&
                            marks <=
                                GlobalData.classes[widget.classIndex]
                                    .subjects[widget.subjectIndex]
                                    .tests[widget.testIndex]
                                    .totalMarks) {
                          widget.onStudentCreated(studentName, marks);
                          Navigator.pop(context);
                        } else {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text('Error'),
                              content: Text(
                                  'Invalid marks. Marks should be between 0 and '
                                  '${GlobalData.classes[widget.classIndex].subjects[widget.subjectIndex].tests[widget.testIndex].totalMarks}.'),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text('OK'),
                                ),
                              ],
                            ),
                          );
                        }
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
                    child: Text('Add Student'),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    }

class StudentPage extends StatefulWidget {
      final int classIndex;
      final int subjectIndex;
      final int testIndex;
      final int studentIndex;
      final VoidCallback onStudentRemoved;

      StudentPage({
        super.key,
        required this.classIndex,
        required this.subjectIndex,
        required this.testIndex,
        required this.studentIndex,
        required this.onStudentRemoved,
      });

      @override
      _StudentPageState createState() => _StudentPageState();
    }

class _StudentPageState extends State<StudentPage> {
      TextEditingController marksController = TextEditingController();

      @override
      Widget build(BuildContext context) {
        Class currentClass = GlobalData.classes[widget.classIndex];
        Subject currentSubject = currentClass.subjects[widget.subjectIndex];
        Test currentTest = currentSubject.tests[widget.testIndex];
        Student currentStudent = currentTest.students[widget.studentIndex];

        return Scaffold(
          appBar: AppBar(
            title: Text('Student Details'),
            backgroundColor: Colors.blue,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Student: ${currentStudent.name}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Marks Obtained: ${currentStudent.marksObtained}',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    controller: marksController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: 'Enter Marks'),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      String marks = marksController.text.trim();
                      if (marks.isNotEmpty) {
                        int marksObtained = int.parse(marks);
                        // Add a check for valid marks
                        if (marksObtained >= 0 &&
                            marksObtained <= currentTest.totalMarks) {
                          setState(() {
                            currentStudent.marksObtained = marksObtained;
                          });
                        } else {
                          // Show an error message or handle invalid marks
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('Invalid Marks'),
                                content: Text(
                                    'Marks should be between 0 and ${currentTest.totalMarks}.'),
                                actions: [
                                  ElevatedButton(
                                    onPressed: () {
                                      widget.onStudentRemoved();
                                      Navigator.pop(context);
                                    },
                                    child: Text('OK'),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      }
                    },
                    child: Text('Save Marks'),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    }
  
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

class ReadOnlyEnterMarksPage extends StatefulWidget {
  final int classIndex;
  final int subjectIndex;
  final int testIndex;

  ReadOnlyEnterMarksPage({super.key, required this.classIndex, required this.subjectIndex, required this.testIndex});

  @override
  _ReadOnlyEnterMarksPageState createState() => _ReadOnlyEnterMarksPageState();
}

class _ReadOnlyEnterMarksPageState extends State<ReadOnlyEnterMarksPage> {
  Test selectedTest = Test(name: '', totalMarks: 0, students: []); // Updated

  @override
  void initState() {
    super.initState();
    selectedTest = GlobalData.classes[widget.classIndex].subjects[widget.subjectIndex].tests[widget.testIndex];
  }

  @override
  Widget build(BuildContext context) {
    List<Student> students = selectedTest.students;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Marks Details',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Test: ${selectedTest.name}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text(
                'Students and Marks:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.all(8.0),
                  margin: EdgeInsets.symmetric(vertical: 8.0),
                  child: DataTable(
                    columns: [
                      DataColumn(label: Text('Student Name')),
                      DataColumn(label: Text('Obtained Marks')),
                      DataColumn(label: Text('Out of Marks')),
                    ],
                    rows: students.map((student) {
                      return DataRow(cells: [
                        DataCell(Text(student.name)),
                        DataCell(Text(student.marksObtained.toString())),
                        DataCell(Text(selectedTest.totalMarks.toString())),
                      ]);
                    }).toList(),
                  ),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Back'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  side: BorderSide(color: Colors.blue, width: 2),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


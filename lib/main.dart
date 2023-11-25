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
    classA.subjects[0].tests.add(Test(name: 'Math Test 1', totalMarks: 100, students: []));
    classA.subjects[1].tests.add(Test(name: 'Science Test 1', totalMarks: 100, students: []));
    classA.subjects[1].tests[0].students.add(Student(name: 'John Doe', marksObtained: 85));

    Class classB = Class(name: 'Class B', subjects: []);
    classB.subjects.add(Subject(name: 'English', tests: []));
    classB.subjects.add(Subject(name: 'History', tests: []));
    classB.subjects[0].tests.add(Test(name: 'English Test 1', totalMarks: 100, students: []));
    classB.subjects[1].tests.add(Test(name: 'History Test 1', totalMarks: 100, students: []));
    classB.subjects[0].tests[0].students.add(Student(name: 'Jane Smith', marksObtained: 92));

    GlobalData.classes = [classA, classB];

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Results App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AdminHomePage(
                      classes: classes,
                      onClassesUpdated: (updatedClasses) {
                        setState(() {
                          classes = updatedClasses;
                        });
                      },
                    ),
                  ),
                );
              },
              child: Text('Admin Login'),
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

  AdminHomePage({super.key, required this.classes, required this.onClassesUpdated});

  @override
  _AdminHomePageState createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  @override
  Widget build(BuildContext context) {
    print(widget.classes);
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Page'),
      ),
      body: ListView.builder(
        itemCount: widget.classes.length,
        itemBuilder: (context, classIndex) {
          String className = widget.classes[classIndex].name;
          return ListTile(
            title: Text(className),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ClassPage(classIndex: classIndex),
                ),
              );
            },
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
                    widget.classes.add(Class(name: className, subjects: []));
                    widget.onClassesUpdated(widget.classes);
                  });
                },
              ),
            ),
          );

          // No need to check className for null, as it's handled in CreateClassPage
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
      ),
      body: Padding(
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
    );
  }
}

class ClassPage extends StatefulWidget {
  final int classIndex;

  ClassPage({super.key, required this.classIndex});

  @override
  _ClassPageState createState() => _ClassPageState();
}

class _ClassPageState extends State<ClassPage> {
  @override
  Widget build(BuildContext context) {
    Class currentClass = GlobalData.classes[widget.classIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text(currentClass.name),
      ),
      body: ListView.builder(
        itemCount: currentClass.subjects.length,
        itemBuilder: (context, subjectIndex) {
          String subjectName = currentClass.subjects[subjectIndex].name;
          return ListTile(
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
                  ),
                ),
              );
            },
          );
        },
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
      ),
      body: Padding(
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
    );
  }
}

class SubjectPage extends StatefulWidget {
  final int classIndex;
  final int subjectIndex;
  final Function(String) onTestCreated;

  SubjectPage({super.key, 
    required this.classIndex,
    required this.subjectIndex,
    required this.onTestCreated,
  });

  @override
  _SubjectPageState createState() => _SubjectPageState();
}

class _SubjectPageState extends State<SubjectPage> {
  @override
  Widget build(BuildContext context) {
    Class currentClass = GlobalData.classes[widget.classIndex];
    Subject currentSubject = currentClass.subjects[widget.subjectIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text(currentSubject.name),
      ),
      body: ListView.builder(
        itemCount: currentSubject.tests.length,
        itemBuilder: (context, testIndex) {
          String testName = currentSubject.tests[testIndex].name;
          return ListTile(
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
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          String? testName = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreateTestPage(
                onTestCreated: (String testName, int totalMarks) { // Updated
                  setState(() {
                    currentSubject.tests.add(Test(
                      name: testName,
                      totalMarks: totalMarks, // Updated
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
      ),
      body: Padding(
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
    );
  }
}

class TestPage extends StatefulWidget {
  final int classIndex;
  final int subjectIndex;
  final int testIndex;
  final void Function(String) onStudentCreated;

  TestPage({super.key, 
    required this.classIndex,
    required this.subjectIndex,
    required this.testIndex,
    required this.onStudentCreated,
  });

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    Class currentClass = GlobalData.classes[widget.classIndex];
    Subject currentSubject = currentClass.subjects[widget.subjectIndex];
    Test currentTest = currentSubject.tests[widget.testIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text(currentTest.name),
      ),
      body: ListView.builder(
        itemCount: currentTest.students.length,
        itemBuilder: (context, studentIndex) {
          String studentName = currentTest.students[studentIndex].name;
          return ListTile(
            title: Text(studentName),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => StudentPage(
                    classIndex: widget.classIndex,
                    subjectIndex: widget.subjectIndex,
                    testIndex: widget.testIndex,
                    studentIndex: studentIndex,
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
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
    );
  }
}

class CreateStudentPage extends StatefulWidget {
  final int classIndex;
  final int subjectIndex;
  final int testIndex;
  final void Function(String, int) onStudentCreated;

  CreateStudentPage({super.key, 
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
      ),
      body: Padding(
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
                  if (marks >= 0 && marks <= GlobalData.classes[widget.classIndex]
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
                        content: Text('Invalid marks. Marks should be between 0 and '
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
    );
  }
}

class StudentPage extends StatefulWidget {
  final int classIndex;
  final int subjectIndex;
  final int testIndex;
  final int studentIndex;

  StudentPage({super.key, 
    required this.classIndex,
    required this.subjectIndex,
    required this.testIndex,
    required this.studentIndex,
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
      ),
      body: Padding(
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
                  if (marksObtained >= 0 && marksObtained <= currentTest.totalMarks) {
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
                          content: Text('Marks should be between 0 and ${currentTest.totalMarks}.'),
                          actions: [
                            ElevatedButton(
                              onPressed: () {
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
    print(widget.classes[0].subjects.length);
    return Scaffold(
      appBar: AppBar(
        title: Text('User Page'),
      ),
      body: ListView.builder(
        itemCount: widget.classes.length,
        itemBuilder: (context, classIndex) {
          String className = widget.classes[classIndex].name;
          return ListTile(
            title: Text(className),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ReadOnlySubjectPage(
                    classIndex: classIndex
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class ReadOnlySubjectPage extends StatefulWidget {
  final int classIndex;

  ReadOnlySubjectPage({super.key, 
    required this.classIndex,
  });

  @override
  _ReadOnlySubjectPageState createState() => _ReadOnlySubjectPageState();
}

class _ReadOnlySubjectPageState extends State<ReadOnlySubjectPage> {
  @override
  Widget build(BuildContext context) {
    print(GlobalData.classes);
    return Scaffold(
      appBar: AppBar(
        title: Text(GlobalData.classes[widget.classIndex].name),
      ),
      body: ListView.builder(
        itemCount: GlobalData.classes[widget.classIndex].subjects.length,
        itemBuilder: (context, subjectIndex) {
          String subjectName = GlobalData.classes[widget.classIndex].subjects[subjectIndex].name;
          return ListTile(
            title: Text(subjectName),
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
          );
        },
      ),
    );
  }
}

class ReadOnlyTestsPage extends StatefulWidget {
  final int classIndex;
  final int subjectIndex;

  ReadOnlyTestsPage({super.key, 
    required this.classIndex,
    required this.subjectIndex,
  });

  @override
  _ReadOnlyTestsPageState createState() => _ReadOnlyTestsPageState();
}

class _ReadOnlyTestsPageState extends State<ReadOnlyTestsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(GlobalData.classes[widget.classIndex].subjects[widget.subjectIndex].name),
      ),
      body: ListView.builder(
        itemCount: GlobalData.classes[widget.classIndex].subjects[widget.subjectIndex].tests.length,
        itemBuilder: (context, testIndex) {
          String testName = GlobalData.classes[widget.classIndex].subjects[widget.subjectIndex].tests[testIndex].name;
          return ListTile(
            title: Text(testName),
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
          );
        },
      ),
    );
  }
}

class ReadOnlyEnterMarksPage extends StatefulWidget {
  final int classIndex;
  final int subjectIndex;
  final int testIndex;

  ReadOnlyEnterMarksPage({super.key, 
    required this.classIndex,
    required this.subjectIndex,
    required this.testIndex,
  });

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
        title: Text('Marks Details'),
      ),
      body: Padding(
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
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}

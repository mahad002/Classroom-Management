import 'package:chatizeck1/Screens/HomePage.dart';

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

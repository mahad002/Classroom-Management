class Class {
  
  String name;
  List<Subject> subjects;

  Class({required this.name, required this.subjects});
}

class Subject {
  String name;
  List<Test> tests;

  Subject({required this.name, required this.tests});
}

class Test {
  String name;
  int totalMarks;
  List<Student> students;

  Test({required this.name, required this.totalMarks, required this.students});
}

class Student {
  String name;
  int marksObtained;

  Student({required this.name, required this.marksObtained});
}

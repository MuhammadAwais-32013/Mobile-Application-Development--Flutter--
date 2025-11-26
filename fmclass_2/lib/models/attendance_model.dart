import 'package:flutter/foundation.dart';
import 'student.dart';

class AttendanceModel extends ChangeNotifier {
  
  final List<Student> _students = [
    Student(id: 1, name: 'Alice Johnson', isPresent: false),
    Student(id: 2, name: 'Bob Smith', isPresent: false),
    Student(id: 3, name: 'Charlie Brown', isPresent: false),
    Student(id: 4, name: 'Diana Prince', isPresent: false),
    Student(id: 5, name: 'Ethan Hunt', isPresent: false),
    Student(id: 6, name: 'Fiona Green', isPresent: false),
    Student(id: 7, name: 'George Miller', isPresent: false),
    Student(id: 8, name: 'Hannah Montana', isPresent: false),
    Student(id: 9, name: 'Isaac Newton', isPresent: false),
    Student(id: 10, name: 'Julia Roberts', isPresent: false),
  ];

  
  List<Student> get students => List.unmodifiable(_students);


  void toggleAttendance(int studentId) {
    final index = _students.indexWhere((student) => student.id == studentId);
    if (index != -1) {
      _students[index] = _students[index].copyWith(
        isPresent: !_students[index].isPresent,
      );
      notifyListeners();
    }
  }

  
  void markAllAbsent() {
    for (int i = 0; i < _students.length; i++) {
      _students[i] = _students[i].copyWith(isPresent: false);
    }
    notifyListeners();
  }

 
  int getPresentCount() {
    return _students.where((student) => student.isPresent).length;
  }


  Student? getStudentById(int studentId) {
    try {
      return _students.firstWhere((student) => student.id == studentId);
    } catch (e) {
      return null;
    }
  }

  bool getStudentAttendance(int studentId) {
    return getStudentById(studentId)?.isPresent ?? false;
  }
}

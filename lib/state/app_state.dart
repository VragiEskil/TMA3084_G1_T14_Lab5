import 'package:flutter/foundation.dart';

import '../models/student.dart';

class AppState extends ChangeNotifier {
  // Navigation State
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  void setIndex(int index) {
    if (_currentIndex == index) return;
    _currentIndex = index;
    notifyListeners();
  }

  // Shared student data state
  final List<Student> _students = [
    Student(
      name: 'Abang Mohamad Naziem bin Abang Mohamad Dzulkhunaini',
      matricNum: '102364',
      programme: 'Software Engineering',
      email: '102364@siswa.unimas.my',
      cgpa: 3.67,
      status: 'Active',
    ),
    Student(
      name: 'Ahmad Muslihin bin Ashyura',
      matricNum: '102387',
      programme: 'Software Engineering',
      email: '102387@siswa.unimas.my',
      cgpa: 3.49,
      status: 'Active',
    ),
    Student(
      name: 'Awang Az Zubair Zufairy bin Awang Pathi',
      matricNum: '102455',
      programme: 'Software Engineering',
      email: '102455@siswa.unimas.my',
      cgpa: 3.76,
      status: 'Active',
    ),
    Student(
      name: 'Dhiaurrahman bin Muhammad Dino',
      matricNum: '102521',
      programme: 'Software Engineering',
      email: '102521@siswa.unimas.my',
      cgpa: 3.56,
      status: 'Active',
    ),
    Student(
      name: 'Putra Nuriman Akmal bin Roziman',
      matricNum: '102917',
      programme: 'Software Engineering',
      email: '102364@siswa.unimas.my',
      cgpa: 3.59,
      status: 'Active',
    ),
    Student(
      name: 'Diana Walstad',
      matricNum: '100235',
      programme: 'Science in Microbiology',
      email: '100235@siswa.unimas.my',
      cgpa: 3.88,
      status: 'Inactive',
    ),
    Student(
      name: 'Tezcatlipoca',
      matricNum: '98072',
      programme: 'Chemical Engineering',
      email: '98072@siswa.unimas.my',
      cgpa: 3.00,
      status: 'Active',
    ),
    Student(
      name: 'Comoyo',
      matricNum: '105821',
      programme: 'Animation',
      email: '105821@siswa.unimas.my',
      cgpa: 3.61,
      status: 'Inactive',
    ),
    Student(
      name: 'Charles Cabbage',
      matricNum: '99113',
      programme: 'Computational Science',
      email: '99113@siswa.unimas.my',
      cgpa: 4.00,
      status: 'Active',
    ),
    Student(
      name: 'Chen Gong',
      matricNum: '101642',
      programme: 'Accountancy',
      email: '101641@siswa.unimas.my',
      cgpa: 3.99,
      status: 'Inactive',
    ),
  ];

  // Exporter to read students securely from UI
  List<Student> get students => _students;

  // Method to add a new student dynamically if required later on
  void addStudent(Student student) {
    _students.add(student);
    notifyListeners();
  }
}

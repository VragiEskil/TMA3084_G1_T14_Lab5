import 'package:flutter/material.dart';

class CategoryProgram extends StatelessWidget {
  const CategoryProgram({super.key});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // We have 3 programmes, so 3 tabs
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Programmes'),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          bottom: const TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            indicatorColor: Colors.white,
            tabs: [
              Tab(text: 'Software Eng.'),
              Tab(text: 'Data Science'),
              Tab(text: 'Cybersecurity'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            // TAB 1: Software Engineering
            Center(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Software Engineering Programme\n\nStudents: Ali Tan, Sara Lee, John Lim',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            // TAB 2: Data Science
            Center(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Data Science Programme\n\nStudents: Aina Rahman, David Ng',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            // TAB 3: Cybersecurity
            Center(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Cybersecurity Programme\n\nStudents: No students yet.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
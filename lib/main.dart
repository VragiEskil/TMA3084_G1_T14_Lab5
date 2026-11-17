import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'state/app_state.dart';

// Import all screens
/*
    !!! NOTICE !!!
    Comment some codes that are underlined in 
    yellow or red when carrying out test run. 
    Some of those features may not be available 
    yet.
*/
import 'screen/homescreen.dart';
import 'screen/student_info.dart';
import 'screen/student_records.dart';
import 'screen/category_program.dart';
import 'screen/about_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => AppState(),
      child: const StudentHubApp(),
    ),
  );
}

class StudentHubApp extends StatelessWidget {
  const StudentHubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StudentHub',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MainShell(),
    );
  }
}

class MainShell extends StatelessWidget {
  const MainShell({super.key});

  // List of main app screens mapped to the navigation index
  static const List<Widget> _pages = [
    HomePage(),
    StudentInfo(),
    StudentRecords(),
    CategoryProgram(),
    AboutPage(),
  ];

  @override
  Widget build(BuildContext context) {
    // Watch the shared app state for index changes
    final appState = context.watch<AppState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'StudentHub Portal',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
      ),
      // Material 3 Navigation Drawer
      drawer: NavigationDrawer(
        selectedIndex: appState.currentIndex,
        onDestinationSelected: (index) {
          appState.setIndex(index);
          Navigator.pop(context); // Close the drawer upon selection
        },
        children: const [
          Padding(
            padding: EdgeInsets.fromLTRB(28, 16, 16, 10),
            child: Text(
              'StudentHub Menu',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Divider(),
          NavigationDrawerDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: Text('Home'),
          ),
          NavigationDrawerDestination(
            icon: Icon(Icons.people_outline),
            selectedIcon: Icon(Icons.people),
            label: Text('Students'),
          ),
          NavigationDrawerDestination(
            icon: Icon(Icons.table_chart_outlined),
            selectedIcon: Icon(Icons.table_chart),
            label: Text('Records'),
          ),
          NavigationDrawerDestination(
            icon: Icon(Icons.category_outlined),
            selectedIcon: Icon(Icons.category),
            label: Text('Programmes'),
          ),
          NavigationDrawerDestination(
            icon: Icon(Icons.info_outline),
            selectedIcon: Icon(Icons.info),
            label: Text('About / Profile'),
          ),
        ],
      ),
      // Active page display
      body: _pages[appState.currentIndex],
      // Material 3 Bottom Navigation Bar
      bottomNavigationBar: NavigationBar(
        selectedIndex: appState.currentIndex,
        onDestinationSelected: (index) {
          context.read<AppState>().setIndex(index);
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.people_outlined),
            selectedIcon: Icon(Icons.people),
            label: 'Students',
          ),
          NavigationDestination(
            icon: Icon(Icons.table_chart_outlined),
            selectedIcon: Icon(Icons.table_chart),
            label: 'Records',
          ),
          NavigationDestination(
            icon: Icon(Icons.category_outlined),
            selectedIcon: Icon(Icons.category),
            label: 'Tabs',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

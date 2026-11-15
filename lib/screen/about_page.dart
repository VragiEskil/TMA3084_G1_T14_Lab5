import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  static const Color primaryBlue = Color(0xFF1976D2);
  static const Color darkBlue = Color(0xFF0D47A1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F8FF),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Layered header using Stack
            SizedBox(
              height: 245,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 190,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [darkBlue, primaryBlue],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(32),
                        bottomRight: Radius.circular(32),
                      ),
                    ),
                  ),

                  // Decorative background shapes
                  Positioned(
                    top: 15,
                    right: 20,
                    child: Icon(
                      Icons.auto_awesome,
                      size: 55,
                      color: Colors.white.withValues(alpha: 0.18),
                    ),
                  ),

                  // Application name
                  const Positioned(
                    top: 35,
                    left: 0,
                    right: 0,
                    child: Column(
                      children: [
                        Text(
                          'Student Hub',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Your Student Management Portal',
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                      ],
                    ),
                  ),

                  // Overlapping profile icon
                  const Positioned(
                    top: 135,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: CircleAvatar(
                        radius: 55,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 48,
                          backgroundColor: Color(0xFFE3F2FD),
                          child: Icon(
                            Icons.school_rounded,
                            size: 55,
                            color: primaryBlue,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // About application
                  _buildInfoCard(
                    icon: Icons.info_outline,
                    title: 'About the Application',
                    content:
                        'Student Hub is a student management application '
                        'developed using Flutter. It provides an organised '
                        'way to browse student information, academic '
                        'programmes, and student records.',
                  ),

                  const SizedBox(height: 16),

                  // Main features
                  Card(
                    elevation: 2,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(18),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            children: [
                              Icon(Icons.star_outline, color: primaryBlue),
                              SizedBox(width: 10),
                              Text(
                                'Main Features',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          _buildFeature(
                            Icons.people_outline,
                            'Student Information',
                          ),
                          _buildFeature(
                            Icons.table_chart_outlined,
                            'Student Records',
                          ),
                          _buildFeature(
                            Icons.category_outlined,
                            'Academic Programmes',
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Development information
                  _buildInfoCard(
                    icon: Icons.groups_outlined,
                    title: 'Development Team',
                    content:
                        'Developed as part of the TMA3084 Software '
                        'Engineering Laboratory course Lab Exercise 5.1: Developing '
                        'a Flutter a Student Management Application Using Flutter '
                        'for Group 14.',
                  ),

                  const SizedBox(height: 16),

                  // Application information
                  _buildInfoCard(
                    icon: Icons.code,
                    title: 'Application Information',
                    content:
                        'Application: Student Hub\n'
                        'Framework: Flutter\n'
                        'Design: Material Design 3\n'
                        'Course: TMA3084',
                  ),

                  const SizedBox(height: 20),

                  const Center(
                    child: Text(
                      'Built with Flutter',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required String title,
    required String content,
  }) {
    return Card(
      elevation: 2,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: primaryBlue),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(content, style: const TextStyle(fontSize: 14, height: 1.5)),
          ],
        ),
      ),
    );
  }

  Widget _buildFeature(IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(icon, color: primaryBlue, size: 22),
          const SizedBox(width: 12),
          Expanded(child: Text(title)),
        ],
      ),
    );
  }
}

// Awang Az Zubair Zufairy

import 'package:flutter/material.dart';

import '../models/student.dart';

class StudentDetails extends StatelessWidget {
  final Student student;

  const StudentDetails({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Student Details')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Card(
              color: colors.primaryContainer,
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 36,
                      backgroundColor: colors.primary,
                      child: Icon(
                        Icons.person,
                        size: 44,
                        color: colors.onPrimary,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      student.name,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(color: colors.onPrimaryContainer),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.badge_outlined),
                    title: const Text('Matric Number'),
                    subtitle: SelectableText(student.matricNum),
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.school_outlined),
                    title: const Text('Programme'),
                    subtitle: SelectableText(student.programme),
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.email_outlined),
                    title: const Text('Email Address'),
                    subtitle: SelectableText(student.email),
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.grade_outlined),
                    title: const Text('CGPA'),
                    subtitle: SelectableText(student.cgpa.toStringAsFixed(2)),
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.info_outline),
                    title: const Text('Status'),
                    subtitle: SelectableText(student.status),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Touch and hold any detail to select and copy it.',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

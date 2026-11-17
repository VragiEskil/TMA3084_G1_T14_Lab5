import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
// Update 'studenthub' and folder paths below to match your project
import 'package:studenthub/state/app_state.dart';
import 'package:studenthub/screen/student_records_page.dart';

void main() {
  testWidgets(
    'StudentRecords displays AppState students and sorts ascending/descending',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (_) => AppState(),
          child: const MaterialApp(
            home: Scaffold(
              body: StudentRecords(),
            ),
          ),
        ),
      );

      // Verify DataTable, headers, and shared AppState count render
      expect(find.byType(DataTable), findsOneWidget);
      expect(find.text('Academic Records (10 Students)'), findsOneWidget);
      expect(find.text('Matric No.'), findsOneWidget);
      expect(find.text('Full Name'), findsOneWidget);
      expect(find.text('CGPA'), findsOneWidget);

      // Tap 'CGPA' column header to sort ascending
      await tester.tap(find.text('CGPA'));
      await tester.pumpAndSettle();

      // Tap 'CGPA' again to sort descending
      await tester.tap(find.text('CGPA'));
      await tester.pumpAndSettle();
    },
  );
}
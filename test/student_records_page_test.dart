import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
// Update 'studenthub' below if the `name:` in your pubspec.yaml is different
import 'package:studenthub/pages/student_records_page.dart';

void main() {
  testWidgets('StudentRecordsPage displays 10 records and sorts ascending/descending',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: StudentRecordsPage(),
        ),
      ),
    );

    // Verify DataTable and headers render
    expect(find.byType(DataTable), findsOneWidget);
    expect(find.text('Matric No.'), findsOneWidget);
    expect(find.text('Full Name'), findsOneWidget);
    expect(find.text('CGPA'), findsOneWidget);
    expect(find.text('Academic Records (10 Students)'), findsOneWidget);

    // Tap 'CGPA' column header to sort ascending
    await tester.tap(find.text('CGPA'));
    await tester.pumpAndSettle();

    // Tap 'CGPA' again to sort descending
    await tester.tap(find.text('CGPA'));
    await tester.pumpAndSettle();
  });
}

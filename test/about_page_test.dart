import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:student_hub/screen/about_page.dart';

void main() {
  testWidgets('About Page displays application information', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: AboutPage()));

    expect(find.byType(AppBar), findsNothing);
    expect(find.text('Student Hub'), findsOneWidget);
    expect(find.text('About the Application'), findsOneWidget);
    expect(find.text('Main Features'), findsOneWidget);
  });

  testWidgets('About Page uses a layered Stack interface', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: AboutPage()));

    expect(find.byType(Stack), findsWidgets);
    expect(find.byType(CircleAvatar), findsWidgets);
  });

  testWidgets('About Page displays development team information', (
    tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: AboutPage()));

    await tester.ensureVisible(find.text('Development Team'));
    await tester.pumpAndSettle();

    expect(find.text('Development Team'), findsOneWidget);
  });
}

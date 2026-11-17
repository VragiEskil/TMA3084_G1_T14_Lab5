import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:student_hub/main.dart';
import 'package:student_hub/state/app_state.dart';

void main() {
  testWidgets('Student Hub smoke test', (WidgetTester tester) async {
    // Build our app with the required AppState provider
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => AppState(),
        child: const StudentHubApp(),
      ),
    );

    // Verify that the app loads successfully and renders the main shell/title
    expect(find.byType(MainShell), findsOneWidget);
  });
}
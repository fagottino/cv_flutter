import 'package:aorlando/core/presentation/widgets/app_error_state_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AppErrorStateWidget', () {
    testWidgets('shows the default title, message and retry action', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppErrorStateWidget(
              message: 'Impossibile caricare il contenuto.',
              onRetry: () {},
            ),
          ),
        ),
      );

      expect(find.text('Qualcosa è andato storto'), findsOneWidget);
      expect(find.text('Impossibile caricare il contenuto.'), findsOneWidget);
      expect(find.text('Riprova'), findsOneWidget);
      expect(find.byIcon(Icons.error_outline_rounded), findsOneWidget);
    });

    testWidgets('hides the retry action when no callback is provided', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppErrorStateWidget(
              message: 'Impossibile caricare il contenuto.',
            ),
          ),
        ),
      );

      expect(find.text('Riprova'), findsNothing);
    });

    testWidgets('invokes the retry callback exactly once', (tester) async {
      var retryCount = 0;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppErrorStateWidget(
              message: 'Impossibile caricare il contenuto.',
              onRetry: () {
                retryCount++;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.text('Riprova'));
      await tester.pump();

      expect(retryCount, 1);
    });
  });
}

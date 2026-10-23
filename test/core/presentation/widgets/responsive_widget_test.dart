import 'package:aorlando/core/presentation/widgets/responsive_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Future<void> pumpResponsiveWidget(
    WidgetTester tester, {
    required double width,
    Widget? mobile,
    Widget? tablet,
    Widget? desktop,
  }) async {
    await tester.binding.setSurfaceSize(
      Size(width, 800),
    );
    addTearDown(() => tester.binding.setSurfaceSize(null));

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ResponsiveWidget(
            mobile: mobile ?? const Text('mobile'),
            tablet: tablet,
            desktop: desktop,
          ),
        ),
      ),
    );
  }

  group('ResponsiveWidget', () {
    testWidgets('renders the mobile widget on narrow layouts', (tester) async {
      await pumpResponsiveWidget(
        tester,
        width: 600,
        tablet: const Text('tablet'),
        desktop: const Text('desktop'),
      );

      expect(find.text('mobile'), findsOneWidget);
      expect(find.text('tablet'), findsNothing);
      expect(find.text('desktop'), findsNothing);
    });

    testWidgets('renders the tablet widget on medium layouts', (tester) async {
      await pumpResponsiveWidget(
        tester,
        width: 900,
        tablet: const Text('tablet'),
        desktop: const Text('desktop'),
      );

      expect(find.text('mobile'), findsNothing);
      expect(find.text('tablet'), findsOneWidget);
      expect(find.text('desktop'), findsNothing);
    });

    testWidgets('renders the desktop widget on wide layouts', (tester) async {
      await pumpResponsiveWidget(
        tester,
        width: 1300,
        tablet: const Text('tablet'),
        desktop: const Text('desktop'),
      );

      expect(find.text('mobile'), findsNothing);
      expect(find.text('tablet'), findsNothing);
      expect(find.text('desktop'), findsOneWidget);
    });

    testWidgets('falls back to mobile when tablet and desktop are missing', (tester) async {
      await pumpResponsiveWidget(
        tester,
        width: 1300,
      );

      expect(find.text('mobile'), findsOneWidget);
    });
  });
}

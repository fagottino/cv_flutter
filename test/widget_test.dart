import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:aorlando/main.dart';

void main() {
  testWidgets('MyApp builds the real application shell', (tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    final materialApp = tester.widget<MaterialApp>(
      find.byType(MaterialApp),
    );

    expect(materialApp.title, 'CV - Antonio Orlando');
    expect(materialApp.debugShowCheckedModeBanner, isFalse);
    expect(find.text('Antonio'), findsOneWidget);
    expect(find.text('Orlando'), findsOneWidget);
  });
}

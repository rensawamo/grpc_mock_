import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/src/app.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../lib/main.dart';

void main() {
  group('App Integration Tests', () {
    testWidgets('MyApp loads and displays correctly', (tester) async {

      // セットアップ
      await tester.pumpWidget(
        const ProviderScope(
          child: MyApp(),
        ),
      );
      await tester.pumpAndSettle();
      await tester.pump(Duration(seconds: 2));

      
      expect(find.text('todo1'), findsOneWidget);

    });
  });
}

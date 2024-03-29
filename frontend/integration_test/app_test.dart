import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/src/app.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import '../lib/src/feature/data/todo_repository.dart';
import 'package:integration_test/integration_test.dart';

class MockRepository extends Mock implements TodoRepository {}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  
  group('App Integration Tests', () {
    Widget createWidgetUnderTest() {
      return MaterialApp(
        title: 'Flutter Tests',
        home: const ProviderScope(
          child: MyApp(),
        ),
      );
    }

    testWidgets('floating buttonで正しくdialogが出るか', (tester) async {
      // セットアップ
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();
      await tester.pump(Duration(seconds: 2));
      // floating　ボタンがタップされたらダイヤログが表示されるか確認
      final Finder floatingButton =
          find.byKey(ValueKey("floatingActionButton"));
      expect(floatingButton, findsOneWidget);

      final dialog = find.byKey(ValueKey("AlertDialog"));
      await tester.tap(floatingButton);
      await tester.pumpAndSettle();
      expect(dialog, findsOneWidget);
    });

    testWidgets('ロード後 checkboxがタップされたとき正しくcheckが入るか', (tester) async {
      // セットアップ
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();
      await tester.pump(Duration(seconds: 2));
      // check box がタップされたtら、チェックボックスがチェックされているか確認
      final Finder checkBox = find.byKey(ValueKey("sample1"));
      expect(checkBox, findsOneWidget);
      await tester.tap(checkBox);
      await tester.pumpAndSettle();
      expect(
          tester.getSemantics(find.byKey(ValueKey("sample1"))),
          matchesSemantics(
            isChecked: true,
            hasEnabledState: true,
            isEnabled: true,
          ));
    });

    // grpcのmockサーバがただし動くか
     testWidgets('ダイヤログのinputが完了したらリストが4つ表示されているか', (tester) async {
      // セットアップ
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();
      await tester.pump(Duration(seconds: 2));
      // check box がタップされたtら、チェックボックスがチェックされているか確認
      final Finder floatingButton =
          find.byKey(ValueKey("floatingActionButton"));
      expect(floatingButton, findsOneWidget);
      await tester.tap(floatingButton);
      await tester.pumpAndSettle();
      final Finder dialog = find.byKey(ValueKey("AlertDialog"));
      expect(dialog, findsOneWidget);

      final Finder textField = find.byKey(ValueKey("TextFormField"));
      await tester.enterText(textField, 'insertbytest');
      await tester.pumpAndSettle();
      final Finder createButton = find.byKey(ValueKey("elevatedButton"));
      await tester.tap(createButton);
      await tester.pumpAndSettle();
      final Finder addItem = find.byType(ListTile).at(3);
      expect(addItem, findsOneWidget);
      expect(find.text('insertbytest'), findsOneWidget);
    });
  });
}

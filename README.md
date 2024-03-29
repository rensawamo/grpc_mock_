

1. Resolving dependencies

```
$ cd ~~ &&  dart pub get
```

2. Start a mock server
```
$ cd mock && dart bin/server.dart
```

If the following log is output to the console, the startup is successful.

```
Server listening on port 8081...
```

## Generating code from a proto file
Please follow the steps below in the grpc directory.
```
$ docker compose up
```

# integration test 

integration test は以下のコマンドで実行する
ホットリスタート機能を行う
```sh
$ flutter run -t integration_test/app_test.dart
```

### Finder 
テストの中でwidgetが存在しているかを確認する
```sh
// Hというテキストを持つwidgetが一つ存在しているかチェック
expect(find.text('H'), findsOneWidget);
```

### descendant+matchRoot
widgetをand条件で見つけたいときにdescendantとmatchRootを活用できる
特定のkeyを持つwidgetが存在しているかを確認する
```sh
Text(key: Key('sample_item_key'), 'REN');

expect(
  find.descendant(
    of: find.byKey(const Key('sample_item_key')),
    matching: find.text('REN'),
    matchRoot: true
  ),
  findsOneWidget
);

```

### 複数のwidgetがある場合の 個別認識
下記の場合で 1番目のリストをタップしたい場合
```sh
 children: [ 
   ListTile...
   ListTile...←これをタップ
   ListTile...
];
```
以下でタップ
```sh
await tester.tap(find.byType(ListTile).at(1));
```

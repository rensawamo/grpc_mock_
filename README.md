

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

# mock サーバと mock オブジェクト
### mock オブジェクト
- 使用場面: ユニットテストでは、システムの特定の部分（通常はメソッドや関数）の動作を隔離してテストします。モックオブジェクトを使用することで、テスト対象のコード以外の部分（例えば、外部サービスの呼び出し）を模擬する。
- 目的: モックオブジェクトは、テスト対象のコードが依存する他のコンポーネントの振る舞いを模倣するために使用されます。これにより、テスト対象のコードが正しく機能するかどうかを、外部の影響を受けずに検証できる。
例: MockClientのように、外部サービスに対する呼び出しを模倣するモックを作成し、特定の入力に対する期待される出力を定義することで、テスト対象のコードが正しく外部サービスと通信できるかをテスト。

# integration test 
使用場面: インテグレーションテストでは、複数のコンポーネントやシステムが互いにどのように連携するかをテストします。モックサーバーは、外部の依存システム（APIサーバーなど）の代わりに設置し、実際の環境を模倣。
目的: モックサーバーを使用することで、実際の外部サービスの代わりにテスト専用の環境を提供し、外部サービスとの連携部分が期待通りに機能するかどうかを検証する。これにより、外部サービスの不安定さやアクセス制限の問題を避けることができる。
例: 実際のAPIサーバーの代わりにモックサーバーを立て、特定のAPI呼び出しに対して期待されるレスポンスを設定します。クライアントがこのモックサーバーと通信することで、実際のAPIとの連携が正しく行われるかをテストする


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

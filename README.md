# Hamster Gacha

[ガチャを起動する](https://msng6220211327-wkk.github.io/hamster/)

画像とアイデアの組み合わせをランダムに楽しむFlutterアプリです。
画像はアプリ内に同梱されているため、実行時のネットワーク接続は不要です。

## 実行方法

Flutter SDKをインストールした環境で、プロジェクトのルートから実行します。

```sh
flutter pub get
flutter run -d chrome
```

macOSアプリとして実行する場合は、Xcodeが必要です。

## 画像の追加・差し替え

画像を `assets/images/` に置き、`lib/main.dart` の画像一覧にパスを追加してください。

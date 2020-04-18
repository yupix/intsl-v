![IntegrationShell](https://repo.akarinext.org/pub/intsl_v/intsl_v.gif "Image")
[![pipeline status](https://dev.akarinext.org/yupix/intsl-v/badges/master/pipeline.svg)](https://dev.akarinext.org/yupix/intsl-v/-/commits/master)
# INTSL V
IntegrationShell(統合シェル)
このProjectは私が開発している[INTSL](https://dev.akarinext.org/yupix/INTSL/-/commits/master)PROJECTの
様々な無駄なコードを削除、保守性の向上を目指して開発されています。
このPROJECTはyupixが主に開発を行い、aki氏にテストして頂いています。
そのため、すべての機能はテストできていません。

## INTSLとの違い
 - コードの保守性の向上
 - コードの短縮
 - 細かなバグの修正
 - 機能の追加
 - 初回設定のスッキプするオプション、Yesを自動で打つオプション

## 進捗
ここに書いてある項目は作業が終わったものです。
 - 設定を変更する際に使用するshの短縮化 2〇〇 -> 77
 - 基本的なサーバー作成機能の修正
 - 初回設定の修正
 - spigotのbuild機能の修正
 - サーバー管理機能の修正
 - サーバーリストの出力機能
 - 本体の更新機能

## 今後の予定
 - もしかして機能の追加

## 既知の不具合
 - サーバーの設定をする際、現在の設定が表示されない
 - 一部のサーバーが動作しない可能性があります。
 - かなり多くの機能が何かしらエラーが発生し、動作しない可能性があります。

## 注意事項
 1.本番環境で使用しないでください
  環境を破壊する原因になる可能性があります。
 2.サーバー作成時に名前に-を使わないでください。
  バグの原因になります。
 3.INTSLで作成されたサーバーはこのprojectで使用できない可能性が高いです。
  INTSL V では多くの変数等が変更されており、INTSLとの互換性は極めて低いです。
 4.バージョンアップ機能を使用しないでください。
  バージョンアップ(バージョンアップ確認)機能は現在修正中の為、
  アップデートするとINTSL-Vの元である、INTSLの頃のデータを仮置きしている為、
  データが確実に破損します。

## 動作環境
本Projectではechoに色を付ける際-eを使用しているため、Dashなどのターミナルを使用している場合、
本来色がつくはずの所が、そのまま -eと出力されてしまう可能性があります。

### 必須パッケージ等
 - unzip
 - wget
 - curl
### OS
 - [ARCHLINUX](https://www.archlinux.org/)

### JAVA
 - [Amazon Corretto 8](https://docs.aws.amazon.com/ja_jp/corretto/latest/corretto-8-ug/downloads-list.html)

### Shell
現在最低限で動作確認が行えるものです。
※非推奨が付いている物は正常に動作しない可能性があります。
- zsh
- Bash
- Dash ※非推奨

## 使い方
### Linux:
準備中

### Windows:
準備中

## author
- [MainSYSTEM / yupix](https://github.com/yupix/)
- [SubSYSTEM / sousuke0422](https://github.com/sousuke0422/)

## サポート
バグの発見または機能の追加に付きましては以下のページ等に報告していただけると助かります。
Issuesは確認までに時間がかかると思われます、早めの対応を
望む場合はDiscordへの参加を推奨します。
- [Discord](https://discord.gg/uDNyePY)
- [issues](https://github.com/yupix/amb/issues)

## ライセンス
|         |                                    |
| ------- | ---------------------------------- |
| INTSL V | Mozilla Public License Version 2.0 |

![IntegrationShell](https://repo.akarinext.org/pub/intsl_v/intsl_v.gif "Image")
[![pipeline status](https://dev.akarinext.org/yupix/intsl-v/badges/master/pipeline.svg)](https://dev.akarinext.org/yupix/intsl-v/-/commits/master)

# INTSL V (AKARI)

IntegrationShell（統合シェル）
このProjectは私が開発している[INTSL](https://dev.akarinext.org/yupix/INTSL/-/commits/master)PROJECTの
さまざまなむだなコードを削除、保守性の向上を目指して開発されています。
このPROJECTはyupixが主に開発を行い、aki氏にテストして頂いています。
そのため、すべての機能はテストできていません。

## INTSLとの違い

- コードの保守性を向上
- コードの短縮
- 細かなバグの修正
- 機能の追加

### 新たな機能

INTSLの際なかった機能一覧です

#### 表向き

- オプション
- サーバーの一覧 / ステータスを確認できるコマンドの追加
- サーバーのWebHookに対応（Discord/Slackのみ）
- 拡張機能のCloudインストールの追加

#### 内部的

- サーバーの起動時に使用するShellを1つで済ませられるように
- サーバーが存在するかのチェックでファイルのみではなく、サーバーリストも確認するように
- 全体的な大幅な改善

## 既知の不具合

- 一部のサーバーエディションを使用できない可能性が有ります

## 修正済みの不具合

- listコマンドを使用した際自動的にサーバーの管理画面に飛ぶ不具合の修正
- オプションの数が9を超えた際ファイル名の指定ができなくなる不具合の修正
- サーバーの作成ができない
- サーバー管理ができない
- サーバーの設定をする際に現在の設定が表示されない
- サーバーの設定でWebHookのURLを設定できない
- カスタムディレクトリを指定した際ディレクトリがないとエラーがでる
- カスタムディレクトリにした際サーバーが正常に削除できない
- カスタムディレクトリにした際指定ディレクトリがない際ファイルを自動生成しない
- 存在しないサーバーのバージョンを選ぶとスパムされる

### システム関連

- 現在なし

### Minecraftサーバー関連

- 現在なし

## リポジトリの更新名

- release
  ┗ stable
- master
  ┗ npm（NextPreviewMaster ※決してnpm（nodejs）とは関係ありません）
- develop
  ┗ unstable
- testing
  ┗ experimental

## 注意事項

 1. 本番環境で使用しないでください  
  環境を破壊する原因になる可能性があります
 2. INTSL　の際に作成した拡張機能などは動かない可能性があります  
  INTSL　V　では多くの変数等が変更されており、INTSLとの互換性は極めて低いです
 3. バージョンアップ機能を使用しないでください  
  バージョンアップ機能は現在保守されておらず、アップデートすると旧バージョンに戻る可能性があります

## 動作環境

本Projectではechoに色を付ける際　-e　を使用しているため、Dashなどのターミナルを使用している場合、
本来色がつくはずの所が、そのまま -eと出力されてしまう可能性があります。

### 必須パッケージ等

- unzip
- curl
- wget
- screen
- [gron](https://github.com/tomnomnom/gron)
  - [archlinux](https://aur.archlinux.org/packages/gron/)

### テスト済みOS

推奨事項をすべて守っている場合に限り安定した可動を望めます

- [UBUNTU](https://ubuntu.com/)
- [ARCHLINUX](https://www.archlinux.org/)
- [WINDOWS(WSL2)](https://www.microsoft.com/ja-jp/software-download/windows10ISO)
  確認済みWSL　ディストリビューション⬇
  - [UBUNTU](https://www.microsoft.com/ja-jp/p/ubuntu/9nblggh4msv6)
  - [ARCHLINUX](https://github.com/yuk7/ArchWSL)

### 一部正常に動作しないOS

一部の機能が正常に動作にしない可能性があります

- BSD系OS
- MAC
- [WINDOWS(WSL1)](https://www.microsoft.com/ja-jp/software-download/windows10ISO)

### 正常に動作しないOS

すべての機能が使用できません

- [WINDOWS(非WSL)]

### 推奨JAVA

- [Amazon Corretto 8](https://docs.aws.amazon.com/ja_jp/corretto/latest/corretto-8-ug/downloads-list.html)
- [AdoptOpenJDK](https://adoptopenjdk.net/)
    ┗ArchLinuxの場合は[こちら](https://github.com/TeamOrangeServer/jdk8-adoptopenjdk-openj9)を使用できます

### 推奨Shell

現在最低限で動作確認が行えるものです。

- zsh
- Bash

## インストール

### ArchLinux

INTSL　VはArchLinuxではパッケージとして利用が可能です
インストールするには以下のコマンドを使用してください
intslのインストール確認にsudoが付いているのはファイルが不足している場合自動で生成する為です。
基本的にintslを使用する際はsudoを付けてください。

```bash
#プロジェクトをクローン
git clone https://dev.akarinext.org/teampimc/intsl-arch.git
#ファイルに入る
cd intsl-arch
#ビルドする （パスワードを求められたら、入力する）
makepkg -sfi
#インストールできたかテスト
sudo intsl
```

### Ubuntu

現在対応中

### Windows

準備中

## author

- [MainSYSTEM / yupix](https://github.com/yupix/)
- [Support / sousuke0422](https://github.com/sousuke0422/)

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

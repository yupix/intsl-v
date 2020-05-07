![IntegrationShell](https://repo.akarinext.org/pub/intsl_v/intsl_v.gif "Image")
[![pipeline status](https://dev.akarinext.org/yupix/intsl-v/badges/master/pipeline.svg)](https://dev.akarinext.org/yupix/intsl-v/-/commits/master)

## このBranchはdevelopです

developBranchはとても不安定なソースコードであり、作業中のコードをcommitしています。
このBranchをcloneして使うことは**推奨**しません。
基本的な事はmasterBranchのREADMEをご覧ください。

## 今後の予定

- サーバーのディレクトリーを変更可能に（予定）
  masterBranchには存在する機能ですが、機能するものの、
  設定が読み込めなくなるなどの不具合があるため作り直す予定です
- サーバーのファイルを1つで行うように（決定事項）

## 既知の不具合

- **サーバー作成機能が使用できません。**
  この問題はmasterBranchのコードを使用することで解消できます。
  developBranchは現在この機能の大幅な修正を行っているため、使用することが困難です。

- サーバーの設定をする際、現在の設定が表示されない

- 一部のサーバーエディションを使用できない可能性があります
  Spigot等一部のサーバーが正常に動作しない可能性があります。

- 多くの機能に不具合などがいます
  developBranchなどに関係なく、多くの不具合が存在します。

- バックアップ機能がコンソールを落とすと停止する
  コンソールでサーバーを起動し、そのコンソールを終了すると、バックアップ機能の停止が確認されています。

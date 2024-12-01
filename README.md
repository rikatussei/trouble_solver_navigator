# README

アプリ名：
trouble_solver_navigator「トラブル解決ナビゲーター」

概要：
トラブル解決をナビゲートするアプリケーションです。発生した問題を記録・分析し、再発防止策の立案をサポートする機能を提供します。

目的：
トラブル対応に取り組む人々を支援
システム的な問題解決アプローチの提供
再発防止策の考えと実施をサポート

使用技術：
ルビー 3.2.0
Ruby on Rails 7.0.8

データベース：
開発環境：MySQL
本環境：PostgreSQL

その他の主要なGem：
device「ログイン機能」
rspec-rails（テスト）
mini_magick（画像処理）
active_hash（マスターデータ管理）
pagy（ページネーション）

その他
Basic認証

セットアップ手順

リポジトリのクローン：

git clone https://github.com/rikatussei/trouble_solver_navigator.git
cd trouble_solver_navigator

依存関係のインストール：
bundle install

データベースの作成と初期化：
rails db:create
rails db:migrate

起動：
rails server


This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
Rubyのバージョン

* System dependencies
システム依存関係

* Configuration
設定

* Database creation
データベースの作成

* Database initialization
データベースの初期化

* How to run the test suite
テストスイートの実行方法

* Services (job queues, cache servers, search engines, etc.)
サービス（ジョブキュー、キャッシュサーバー、検索エンジンなど）

* Deployment instructions
デプロイメントの指示

* ...


# テーブル設計

## users"ユーザー情報" テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| affiliation        | string | null: false               |

### Association
- has_many :user_events
- has_many :events, through: :user_events
- has_many :comments 


## events"出来事" テーブル

| Column              | Type      | Options                        |
| ------------------- | --------- | ------------------------------ |
| title               | string    | null: false                    |
| description         | text      | null: false                    |
| occurred_on         | date      | null: false                    |
| location            | string    | null: false                    |
| cause_type_id       | integer   | null: false                    |
| detailed_cause      | string    |                                |
| resolution          | text      |                                |
| user                | references| null: false, foreign_key: true |

### Association
- has_many :user_events
- has_many :users, through: :user_events
- has_many :comments
- has_many :support_tickets
- has_many_attached :photos


## SupportTickets"保守管理テーブル" テーブル

| Column               | Type             | Options                        |
| -------------------- | ---------------- | ------------------------------ |
| analysis             | text             |                                |
| prevention_plan      | text             |                                |
| event                | references       | null: false, foreign_key: true |

### Association
belongs_to :event 


## UserEvents"中間" テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| user           | references | null: false, foreign_key: true |
| event          | references | null: false, foreign_key: true |

### Association
- belongs_to :user 
- belongs_to :event


## Comments"コメント" テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| content        | string     | null: false                    |
| user           | references | null: false, foreign_key: true |
| event          | references | null: false, foreign_key: true |

### Association
- belongs_to :user 
- belongs_to :event

※技術的な課題
⒈device導入後に開発をしている過程でログアウト不能になる。ただし、セッション切れになるとログアウトされる。
⒉プレビュー機能の実装後の開発過程でなぜかプレビューが使用不可になる。


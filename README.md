# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

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
| prevention          | text      |                                |
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
| detailed_description | text             |                                |
| analysis             | text             |                                |
| corrective_action    | text             |                                |
| prevention_plan      | text             |                                |
| ticket               | references       | null: false, foreign_key: true |
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

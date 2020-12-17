アプリ名
CookColumn

概要
料理のレシピ・調理技術・おすすめの調理器具などを投稿することができる

本番環境

制作背景（意図）
料理のレシピや技術は、ネット検索を行えば学ぶことができるが、
自分が知りたい内容に応じて、その都度検索をかけて調べるのは手間がかかる。
その為、料理に関係する情報を一つにまとめることによって知りたいことがすぐに
知ることができるアプリを制作した

DEMO

工夫したポイント
・多階層カテゴリー検索・タグ機能・投稿検索機能など、知りたい内容に応じて
すぐに検索をかけられる機能を多数実装
・料理をしているところを分かりやすく視覚化する為に、動画投稿機能を実装

使用技術（開発環境）
・Ruby on Rails
・HTML
・CSS
・Mysql
・Github

課題や今後実装したい機能
・


# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :cooks
- has_many :comments

## cooks テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| title  | string     | null: false                    |
| text   | text       | null: false                    |
| genre  | integer    | null: false                    |
| user   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :tag
- has_many :comments
- has_many :tags, through: cook_tag_relations

## comments テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| cook   | references | null: false, foreign_key: true |
| text   | text       | null: false                    |

### Association

- belongs_to :cook
- belongs_to :user

## tags テーブル

| Column | Type   | Options    |
| ------ | ------ | ---------- |
| name   | string | null:false |

### Association

- has_many :cooks, through: cook_tag_relations

## cook_tag_relations テーブル

| Column | Type      | Options                        |
| ------ | --------- | ------------------------------ |
| cook   | references| null: false, foreign_key: true |
| tag    | references| null: false, foreign_key: true |

- belongs_to :tag
- belongs_to :cook

## categories テーブル

| Column | Type   | Options    |
| ------ | ------ | ---------- |
| name   | string | null: false|

- has_many :cooks
- has_ancestry
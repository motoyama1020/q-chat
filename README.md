# 概要
## どんなアプリか
「謎解きゲームに参加したいけど、一人だと詰まりそうだし、一緒にいく人もいない。」
「全く知らない人と組むのもなんだかなー」

その悩みわかります！！
この様なイベントに参加するのって勇気入りますよね！

あなたにその勇気与えます！

これは謎解きが好きな方の為の、体験型ゲームに参加する際のメンバー募集サイトです。

## 作成意図
## URL
## 利用シーン
## 機能一覧
- 
- 
- 
- 
## 環境・使用技術
### フロントエンド
- 
- 
- 
### バックエンド
- 
- 
### 開発環境
- 
- 
- 
- 
### 本番環境
- 
- 
- 
### テスト
- 
- 
- 
## ER図


# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :room_users
- has_many :rooms, through: room_users
- has_many :messages

## rooms テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |

### Association

- has_many :room_users
- has_many :users, through: room_users
- has_many :messages

## room_users テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user

## messages テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     |                                |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user

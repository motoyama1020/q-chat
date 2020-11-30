# 概要

## どんなアプリか
「謎解きゲームに参加したいけど、一人だと詰まりそうだし、一緒にいく人もいない」
「全く知らない人と組むのもなんだかなー」

その悩みわかります！！
この様なイベントに参加するのって勇気入りますよね！

あなたにその勇気与えます！

これは謎解きが好きな方の為の、体験型ゲームに参加する際のメンバー募集サイトです。

## 作成の背景
リアル脱出ゲームはご存知ですか？
約1時間、６人１チームで用意された謎を解き切るイベントです。
６人に満たない人数で参加の場合は、全く知らない人とマッチすることになります。

これが醍醐味の一つではあります。
しかし、チーム内で謎解きレベルに差があり過ぎると、片方はついていけず、今何をしているのか分からなくなったり、初対面の人に作業を依頼する事が苦手で、やり辛さを感じる人もいると思います。

自分もこの様な問題に直面して、予め組む人とコミュニケーションが取れるサービスがあったら、もっと謎解きを楽しめるし、初心者の人でも安心して参加できるのではないかと考え、このサービスを作ろうと思いました。

## URL
要件定義 スプレッドシート

## 利用の仕方
【リーダー側】
- 行きたい謎解きゲームがあるが、予めメンバーを募りたい時に、期間や人数、レベルを設定してルームを立ち上げる。

【メンバー側】
- ルームの情報（何の謎解きか、場所、期間、レベル）を確認して、自分の条件にマッチしたルームに入る。

## 機能一覧
- ユーザー管理機能(devise)
  →ニックネーム、イベント参加回数、クリア回数、得意分野
- チャットルーム作成＆削除機能
- メッセージ＆画像投稿機能
- チャットルーム検索機能

これから実装したい機能
- 定員制限機能
- メンバー評価機能
  →チャットルームを組んだことがあるという制限を付けたい
- ランキング機能
  →イベント参加回数、クリア回数、他己評価


## 環境・使用技術

### フロントエンド
- Bulma@ 0.9.1
- HTML/CSS

### バックエンド
- Ruby 2.6.5
- Rails 6.0.0

### インフラ
- MySQL2
- AWS

### テスト
- RSpec
- FactoryBot 
- faker

## ER図
https://gyazo.com/f553d9ef9b507f3b3f8fbbba25067716

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

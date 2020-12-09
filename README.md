# 概要

## どんなアプリか
「謎解きゲームに参加したいけど、一人だと詰まりそうだし、一緒にいく人もいない」
「全く知らない人と組むのもなんだかなー」

その悩みわかります！！
この様なイベントに参加するのって勇気入りますよね！

あなたにその勇気与えます！

これは謎解きが好きな方の為の、体験型ゲームに参加する際のメンバー募集サイトです。

### チャットルーム機能
[![Image from Gyazo](https://i.gyazo.com/0870066994e02fa58bc014a390ba3732.gif)](https://gyazo.com/0870066994e02fa58bc014a390ba3732)

### カテゴリ検索機能
[![Image from Gyazo](https://i.gyazo.com/bd62d99551859ed72db8fc55ce72e70a.gif)](https://gyazo.com/bd62d99551859ed72db8fc55ce72e70a)

## 作成の背景
リアル脱出ゲームはご存知ですか？
約1時間、６人１チームで用意された謎を解き切るイベントです。
６人に満たない人数で参加の場合は、全く知らない人とマッチすることになります。

これが醍醐味の一つではあります。
しかし、チーム内で謎解きレベルに差があり過ぎると、片方はついていけず、今何をしているのか分からなくなったり、初対面の人に作業を依頼する事が苦手で、やり辛さを感じる人もいると思います。

自分もこの様な問題に直面して、予め組む人とコミュニケーションが取れるサービスがあったら、もっと謎解きを楽しめるし、初心者の人でも安心して参加できるのではないかと考え、このサービスを作ろうと思いました。

## URL
アプリケーション
- https://q-chat31740.herokuapp.com/

要件定義 
- https://docs.google.com/spreadsheets/d/1A0YX617IfG6-_adEmP4nZPCO1LmcpFChfyOzz1AaF24/edit#gid=282075926

## 利用の仕方
【リーダー側】
- 行きたい謎解きゲームがあるが、予めメンバーを募りたい時に、期間や人数、レベルを設定してルームを立ち上げる。

【メンバー側】
- ルームの情報（何の謎解きか、場所、期間、レベル）を確認して、自分の条件にマッチしたルームに入る。

## 機能一覧
- ユーザーログイン機能
　→deviseの導入
- ユーザー情報編集機能(onオプション)
　→イベント参加回数、クリア回数、成功率の出力
- チャットルーム作成機能
　→ActiveHashの導入
- メッセージ＆画像投稿機能
　→ActiveStrage,AWS(S3)の導入
- チャットルーム検索機能
　→ransackの導入
- ユーザーアイコン表示
- ゲストログイン機能

実装予定の機能
- テキスト投稿非同期通信
- 定員制限機能
- レーティングスター機能
　→チャットルームを組んだことがあるという制限を付けたい
- パンくずリスト
- ランキング機能
　→イベント参加回数、クリア回数、他己評価


## 環境・使用技術

### デプロイ
- heroku

### フロントエンド
- HTML/CSS
- Bulma@ 0.9.1

### バックエンド
- Ruby 2.6.5
- Rails 6.0.0

### インフラ
- MySQL2
- AWS　S3

### テスト
- RSpec
- FactoryBot 
- faker

## ER図
![画像の説明](https://i.gyazo.com/fc087c13a0a7795bb3ab97b1c1ccfb2e.png)

# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| name               | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false, unique: true |
| event_time         | integer |                           |
| clear_time         | integer |                           |

### Association

- has_many :room_users
- has_many :rooms, through: room_users
- has_many :messages

## rooms テーブル

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| name          | string  | null: false |
| year_id       | integer | null: false |
| month_id      | integer | null: false |
| prefecture_id | integer | null: false |
| capacity_id   | integer | null: false |


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
| content | string     | null: false                    |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user

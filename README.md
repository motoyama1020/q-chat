# 概要

## どんなアプリか
「謎解きゲームに参加したいけど、一人だと詰まりそうだし、一緒にいく人もいない」
「全く知らない人と組むのもなんだかなー」

その悩みわかります！！
この様なイベントに参加するのって勇気入りますよね！

あなたにその勇気与えます！

これは謎解きが好きな方の為の、体験型ゲームに参加する際のメンバー募集サイトです。

### チャットルーム機能
[![Image from Gyazo](https://i.gyazo.com/f8982e38edd590d01b38d009b793a874.gif)](https://gyazo.com/f8982e38edd590d01b38d009b793a874)


## 作成の背景
リアル脱出ゲームはご存知ですか？
約1時間、６人１チームで用意された謎を解き切るイベントです。
６人に満たない人数で参加の場合は、全く知らない人とマッチすることになります。

これが醍醐味の一つではあります。
しかし、チーム内で謎解きレベルに差があり過ぎると、片方はついていけず、今何をしているのか分からなくなったり、初対面の人に作業を依頼する事が苦手で、やり辛さを感じる人もいると思います。

自分もこの様な問題に直面して、予め組む人とコミュニケーションが取れるサービスがあったら、もっと謎解きを楽しめるし、初心者の人でも安心して参加できるのではないかと考え、このサービスを作ろうと思いました。

## URL
アプリケーション
- http://54.248.149.121/
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
- エラー文の日本語表示機能

実装予定の機能
- テキスト投稿非同期通信
- 定員制限機能
- レーティングスター機能  
→チャットルームを組んだことがあるという制限を付けたい
- パンくずリスト
- ランキング機能  
→イベント参加回数、クリア回数、他己評価

## 工夫したポイント
- 誰が投稿したのか一目でわかるように、メッセージに人物アイコンを紐付けました。
[![Image from Gyazo](https://i.gyazo.com/de41175799b5deac9d20d2fa14bd45f4.png)](https://gyazo.com/de41175799b5deac9d20d2fa14bd45f4)

- ボタンは全てアイコン表示とし、情報量を減らしコンパクトにまとめました。
[![Image from Gyazo](https://i.gyazo.com/07f70973cf50fc8b7694d124cca6690e.png)](https://gyazo.com/07f70973cf50fc8b7694d124cca6690e)

- 要素毎で検索が可能となるようにカテゴリ検索機能を付けました。
[![Image from Gyazo](https://i.gyazo.com/e5ea9f437e3aa42ca92f15e9b332ede4.gif)](https://gyazo.com/e5ea9f437e3aa42ca92f15e9b332ede4)

## 本アプリの問題点
- 誰でもチャットルームに入りメッセージ投稿ができてしまう為、収集が付かなくなることが予想されます。  
したがって、定員が集まり次第任意のユーザー以外ルームの検索と入室ができないようにするべきだと考えています。

- ユーザー同士のやり取りがルーム内だけである為、イベント後に仲良くなった場合のコミュニケーションが取れないです。  
したがって、フォロー機能やDM機能を実装することも考えています。

- パスワードの変更ができない為、その機能を追加する必要があります。

## 環境・使用技術

### デプロイ
- AWS EC2 
- heroku

### フロントエンド
- HTML/CSS
- Bulma@ 0.9.1

### バックエンド
- Ruby 2.6.5
- Rails 6.0.0

### インフラ
- MySQL2
- AWS→S3

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

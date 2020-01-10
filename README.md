# README　このアプリについて
***

## :bamboo:川柳縛りとは
川柳投稿サイト。
<br></br>
投稿した川柳に「いいね」をつける事ができ、ランキング形式で表示できる。
<br></br>
お題を決めて5・7・5縛りでチャットする事ができる。
<br></br>
川柳クイズも楽しめる。

## :memo:概要
アプリ名：川柳縛り
<br></br>
使用言語：HTML/CSS/Ruby/Rails/JavaScript/MySQL/AWS/Github/Visual Studio Code
<br></br>
機能：新規会員登録・ログイン機能・川柳投稿機能・いいね機能・ランキング機能・チャット機能(非同期通信・自動更新)・クイズ
<br></br>
作業人数：1人（個人制作）
<br></br>
作業期間：約2週間

## :earth_africa:URL
### URL：[http://18.178.3.27/](http://18.178.3.27/)


# :memo:DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false|
|password|string|null: false|
|username|string|null: false|
### Association
- has_many :posts
- has_many :messages
- has_many :likes
- has_many :texts
- has_many :iines

## postsテーブル
|Column|Type|Options|
|------|----|-------|
|title|text|null: false|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- has_many :messages
- has_many :likes

## messagesテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|post_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :post
- belongs_to :user

## likesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|post_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :post
- belongs_to :user

## textsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- has_many :iines

## iinesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|text_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :text
- belongs_to :user


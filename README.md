# README　このアプリについて
***

## :bamboo:川柳縛りとは
川柳投稿サイト。
<br></br>
ユーザー登録すれば川柳投稿や川柳チャットができる。（ユーザー登録しなくても閲覧はできる。）
<br></br>
投稿した川柳に「いいね」をつける事ができる。
<br></br>
お題を決めて5・7・5縛りでチャットする事ができる。
<br></br>
新着順・古い順・ランキング順（いいね順）で表示できる。
<br></br>
川柳三択クイズも楽しめる。

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

## :computer:機能詳細

<h2 align="center">〜川柳チャット〜</h2>
<p align="center">5・7・5でチャットする事ができる。jQueryのAjaxによる非同期通信・自動更新機能あり。</p>

![a9adddc754e61e041247f12406c8c458](https://user-images.githubusercontent.com/57311079/72241258-b6673e80-3629-11ea-8634-4ba70756dc00.gif)

<h2 align="center">〜今日の川柳〜</h2>
<p align="center">思いついた川柳をなんでも投稿できる。いいね機能があり、ランキング形式で表示できる。</p>

![839566c3aa153d8aad123bcebc8be116](https://user-images.githubusercontent.com/57311079/72241594-88cec500-362a-11ea-9cee-e9741961cf08.gif)

<h2 align="center">〜川柳三択クイズ〜</h2>
<p align="center">川柳の歴史や特徴についての三択クイズを楽しめる。</p>

![5ad6b663fb8cc474a6e7bebbcb97bfde](https://user-images.githubusercontent.com/57311079/72241909-6c7f5800-362b-11ea-9113-9a365a0718fb.gif)

<h2 align="center">〜ユーザ情報〜</h2>
<p align="center">自分の投稿した川柳やいいねした川柳を閲覧できる。</p>

![0a1f4db7bd6e879408c8fc223cbcb7dc](https://user-images.githubusercontent.com/57311079/72242156-0c3ce600-362c-11ea-9e35-5f20de6a2ec9.gif)


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

## :memo:ER図
![fd6b664f63a9355f92e0f4070b26c52b](https://user-images.githubusercontent.com/57311079/72143814-c4735000-33da-11ea-9592-c33c4e79133a.png)

# README　このアプリについて
***

## :bamboo:川柳縛りとは
川柳投稿サイト。
ユーザー登録すれば川柳投稿や川柳チャットができる。（ユーザー登録しなくても閲覧はできる。）
投稿した川柳に「いいね」をつける事ができる。
お題を決めて5・7・5縛りでチャットする事ができる。
新着順・古い順・ランキング順（いいね順）で表示できる。
川柳三択クイズも楽しめる。

## :bulb:なぜ作ったか？
雑誌の応募企画などに、川柳を投稿するのが好きだったので作りました。
自分の投稿した川柳が雑誌に掲載された時は嬉しかった事もあり、自分の川柳が評価される機能をつけたいと思い、いいね機能をつけてランキングで表示できる様にしました。
川柳チャット機能はあえて5・7・5で制限をかけてチャットできる様にしたら、面白いやりとりができるのではないかと思ったので作りました。
また、川柳をもっと知りたい、学びたいと思う人の為にクイズも作りました。

## :memo:概要
* アプリ名：川柳縛り
* 使用言語：HTML/CSS/Ruby/Rails/JavaScript/MySQL/AWS/Github/Visual Studio Code
* 機能：新規会員登録・ログイン機能・川柳投稿機能・いいね機能・ランキング機能・チャット機能(非同期通信・自動更新)・クイズ
* 作業人数：1人（個人制作）
* 作業期間：約2週間

## :earth_africa:URL
### URL：[http://18.178.3.27/](http://18.178.3.27/)

## :computer:機能詳細

<h2 align="center">〜川柳チャット〜</h2>
<p align="center">5・7・5でチャットする事ができる。jQueryのAjaxによる非同期通信・自動更新機能あり。</p>

![a9adddc754e61e041247f12406c8c458](https://user-images.githubusercontent.com/57311079/72241258-b6673e80-3629-11ea-8634-4ba70756dc00.gif)

<h2 align="center">〜今日の川柳〜</h2>
<p align="center">思いついた川柳をなんでも投稿できる。いいね機能があり、ランキング形式で表示できる。</p>

![839566c3aa153d8aad123bcebc8be116](https://user-images.githubusercontent.com/57311079/72241594-88cec500-362a-11ea-9cee-e9741961cf08.gif)

<h2 align="center">〜コメント機能＆削除機能〜</h2>
<p align="center">投稿された川柳にコメントを書く事ができる。コメントの削除もできる。川柳投稿者は投稿した川柳の削除もできる。</p>

![aaa4103c0a48d03a648adbae110693a4](https://user-images.githubusercontent.com/57311079/72663602-c3c06680-3a37-11ea-9782-637742f6f0cc.gif)

<h2 align="center">〜川柳三択クイズ〜</h2>
<p align="center">川柳の歴史や特徴についての三択クイズを楽しめる。</p>

![5ad6b663fb8cc474a6e7bebbcb97bfde](https://user-images.githubusercontent.com/57311079/72241909-6c7f5800-362b-11ea-9113-9a365a0718fb.gif)

<h2 align="center">〜ユーザー情報詳細〜</h2>
<p align="center">自分の投稿した川柳やいいねした川柳を閲覧できる。</p>

![0a1f4db7bd6e879408c8fc223cbcb7dc](https://user-images.githubusercontent.com/57311079/72242156-0c3ce600-362c-11ea-9e35-5f20de6a2ec9.gif)


## :paperclip:追加したい機能
* フォームを5・7・5に分割して分けて、バリデーションしっかり設定したい。
* ユーザーランキング(いいね順）も表示できる様にしたい
* 川柳っぽくする為に縦書きで筆で書いた様に表示される様にしたい。(その際は横スクロール)
* 詳細ページに行かなくてもいいねできる様にしたい。（非同期通信）（アイコンにする）
* 検索機能つけたい

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
|content|string|null: false|
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

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|content|string|null: false|
|user_id|integer|null: false, foreign_key: true|
|text_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :text
- belongs_to :user

## :memo:ER図
![2a8be06f6d8d0a14f18e4da25d0a5b00](https://user-images.githubusercontent.com/57311079/72663860-814c5900-3a3a-11ea-890d-91adaec1fda4.png)


# README
<p align="center">
<img src="https://user-images.githubusercontent.com/80203224/131814532-5f08bb7d-2350-4ccc-866b-8ba1f9e25520.png" width="400px"></p>

DENTAL SHARE
---
<h3>マスクの習慣化・おうち時間増加・外食の機会が大幅に激減、<br>
そんな中で歯列矯正の需要が高まっているのはご存知でしょうか？</h3>
<h4>コロナ禍で需要拡大している産業として歯列矯正にフォーカスしたアプリケーションを作成しました。</h4>

![スクリーンショット 2021-09-02 18 03 03](https://user-images.githubusercontent.com/80203224/131815835-1551244c-5544-4384-a1fa-b9296fa164d5.png)
![スクリーンショット 2021-09-02 18 02 53](https://user-images.githubusercontent.com/80203224/131815828-36c4e7b4-3f08-4d4c-8d42-81db6289fc1f.png)


heroku URL
---
https://dental-share-app.herokuapp.com/


開発言語
---
- Ruby 3.0.1
- Rails 6.1.4

機能一覧
---
- ログイン機能
- ソーシャルログイン機能（google・twitter）
- CRUD機能（カウンセリング口コミ投稿機能・日記投稿機能）
- フォロー機能
- コメント機能
- いいね・ブックマーク機能
- 検索機能
- 非同期処理
- 画像投稿（Active Storage　ストレージ：AWS S3利用)

使用技術・gem
---
- 'aws-sdk-s3'
- 'devise'
- 'rails_admin'
- 'cancancan'
- 'devise-i18n'
- 'omniauth'
-  'omniauth-google-oauth2'
- 'omniauth-twitter'
- 'simple_calendar'
- 'Nokogiri' ※病院情報取得次に利用
- 'ransack'
- 'kaminari'

実行手順
---
```
$ git clone https://github.com/YuriAkita/dental_share.git
$ cd dental_share
$ bundle install
$ rails db:create && rails db:migrate
$ rails s
```

カタログ設計
---
https://docs.google.com/spreadsheets/d/1PThJ5lkPfScfpo1LuvH7e857xyIbsVfO8JUFk5hPL88/edit?usp=sharing

テーブル定義書
---
https://docs.google.com/spreadsheets/d/1PThJ5lkPfScfpo1LuvH7e857xyIbsVfO8JUFk5hPL88/edit?usp=sharing

ワイヤーフレーム
---
https://cacoo.com/diagrams/ncMTuovoDhmQfhGm/C7213

ER図
---
![ER図修正](https://user-images.githubusercontent.com/80203224/127020942-f81529b3-40a9-4099-a9fa-5bcaadb461fe.png)

画面遷移図
---
![画面遷移図 (1)](https://user-images.githubusercontent.com/80203224/126349067-0e9b6902-9896-4f05-870b-8a95f55160ba.png)

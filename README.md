# NAGANO CAKE
このサイトは、DMM webcamp 2ヶ月目のチーム制作フェーズで作られたサイトです。  
インスタグラムで話題になったお店として、地元の方以外にも商品をお届けしたい！  
そんな気持ちにお応えしました。(架空)  

# Let's start!
```
$ git clone https://github.com/kantouken-blacks/nagano-cake.git
$ cd nagano-cake
$ rails db:seed
$ rails s -b 0.0.0.0
```

[ローカルサーバー](http://localhost:3000)にアクセスしてご覧ください。  
ジャンル、商品の登録等は[管理者ログインページ](http://localhost:3000/admin/sign_in)より、  
メールアドレス：masaharu@mail  
パスワード：masaharu  
を入力してログインしてください。


# 実装機能
- user
  - 会員登録・編集・退会
  - 商品の閲覧・カートに入れる・注文
  - ジャンル検索
  - 注文履歴の確認
  
- admin
  - ジャンル登録・編集・非表示選択
  - 商品の登録・編集・削除・非表示選択
  - 注文履歴の確認・進捗ステータスの変更
  - 会員情報の確認・編集

# 開発環境
- Ruby 2.5.7
- Rails 5.2.4.1
- SQlite3 1.4.2
- HTML5
- CSS3
- Gems
  - Bootstrap4
  - jQuery-rails
  - kaminari
  - devies

# チーム関東圏ブラックス
苦し紛れに捻りだした共通点が、関東圏に住んでることと黒いアイテムを身に付けている事だけだったチーム。  
スローガンは「勝って学ぶ、それこそが経験」  
強気なことを言っているが、オールブラックスの丸パクリである。
- [15765-akaha](https://github.com/15765-akaha)
  - Model、Controllerの詳細設計
  - Model初期設定
  - ヘッダー/フッター・TOPページ・サンクスページ
  - 商品一覧/詳細/ジャンル検索
  - マイページ/会員情報編集ページ
  - 退会ページ
- [xkilaboshix](https://github.com/xkilaboshix)
  - Model、Controllerの詳細設計
  - Route初期設定
  - カートに商品を入れて注文確定するまでのシステム
  - 会員登録/ログイン
  - 注文履歴一覧/詳細
- [kanon2580](https://github.com/kanon2580)
  - 管理者サイト
  - ECサイトデザイン

### 2020 Kantouken-blacks inc.
短い間だったけど お疲れ様でした！ありがとう！ by kanon2580

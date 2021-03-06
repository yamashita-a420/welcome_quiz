# サービス概要
オリジナルの質問３つをランダム表示するクイズをつくって、
結婚式などのイベントで、ゲストに話のタネを提供できる
ウェルカムクイズメーカーです。

# メインのターゲットユーザー
- 会場に飾る写真の説明がしたい人
- オリジナルクイズの演出を手軽にしたい人
- ちょっと変わった演出がしたい人

# ユーザーが抱える課題
凝った演出を用意する時間がない。
歓談が中心のイベントをしたいけど、なにか話題がほしい。
ゲストに楽しんでほしい。

# 解決方法
## ユーザー
さっとクイズを作成する（会場に飾る写真を選ぶついでなど）
当日ウェルカムスペースやテーブル上にQRコードを掲示する

## ゲスト
簡単に参加できる
参加者同士で異なる結果を見せ合うことで、話のタネになる

# 実装予定の機能
## ユーザー
- 質問［ 写真・質問文・コメント・解説・難易度・選択肢・正誤）］を登録できる
- ゲストの [ 名前・メッセージ ] を見ることができる
- ランダムに質問を組み合わせて、クイズを作成できる

## ゲスト
- クイズを解き終わったらQAと得点を見ることができる
- 名前とひとことメッセージを送信できる

## 管理者
- 作成ユーザーのCRUD
- 質問のCRUD

# 追加実装したい機能
## ユーザー
- 印刷用画面の作成
  《→スマホが得意でないゲスト向けに、印刷用も作成できる》
- 公開・非公開を選べる
- ゲストの [ 得点・質問と回答状況 ] を見ることができる
  《→得点が見れるので、高得点者にプレセント用意などしてもよい。》
- イベントのテーマに合わせたデザインを選べる
- 難易度をバランス良くランダム表示する
  e.g.難易度１,２,３の質問を１つずつ順番に出題する
- 質問検索機能

## 管理者
- ゲストメッセージのCRUD

# なぜこのサービスを作りたいのか？
結婚式の準備のなかで、ウェルカムスペースに飾る写真について、
どの写真がどこで撮ったものかわかるように飾りたいと思いました。
ただ、コロナ禍においてオンラインで打ち合わせをしていると、会場のどこにどう飾るのが良いか
いまいちわからない上に、指示するのも大変な状況です。
そういった状況でも手軽に写真に説明をつけられて、かつちょっとした演出になり、
ゲストに楽しんでもらえるのではないかと考えたためです。

# スケジュール
- README・画面遷移図・ER図：〜5/18(水)
- メイン機能実装：〜5/29(日)
- β版をRUNTEQ内リリース（MVP）：〜5/30(月)
- 本番リリース：〜6/13(月)

# 画面遷移図
https://www.figma.com/file/fQTXVJNUrQCDqXH4WXa2mL/%E8%B3%AA%E5%95%8F?node-id=0%3A1

# ER図
https://gyazo.com/ae076b3940135c5035c1d6a5b2e99e7d

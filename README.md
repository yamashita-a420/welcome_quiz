# サービス概要
結婚式などのイベントで、自分たちのことを紹介する演出をしたい人が
オリジナル質問３つをランダム表示するクイズを手軽に作成して、
ゲストに話のタネを提供するウェルカムクイズアプリです。

# メインのターゲットユーザー
楽しく自分たちのことを紹介する演出がしたい人
会場に飾る写真の説明がしたい人
ちょっと変わった演出がしたい人

# ユーザーが抱える課題
凝った演出を用意する時間がない。
歓談が中心のイベントをしたいけど、なにか話のタネがほしい。
自分たちのことを知ってもらう演出をして、ゲストに楽しんでほしい。

# 解決方法
会場装飾用の写真を選ぶついでに、さっとオンラインでクイズを作成する。
ドレスの色当てクイズのように、ゲストが簡単に参加できる。
当日ウェルカムスペースやテーブル上にQRコードを掲示。
クイズが終わったら、質問と解答の答え合わせ一覧を表示。
クイズは３問ランダム表示のため、参加者同士で異なる結果を見せ合ったり、話のタネになる。

# 実装予定の機能
## クイズ作成ユーザー
・質問［ 写真・質問文・コメント・難易度・選択肢（正解・ダミー）］を登録できる。
・ランダムに質問を組み合わせて、クイズを作成できる。

## ゲストユーザー
・クイズを解き終わったら、一覧でQAが見れる。

## 管理ユーザー
・作成ユーザーのCRUD
・質問のCRUD

# 追加実装したい機能
## クイズ作成ユーザー
・印刷用画面の作成
《→スマホが得意でないゲスト向けに、印刷用も作成できる》
・公開・非公開選べる
・難易度をバランス良くランダム表示する
　e.g.難易度１,２,３の質問を１つずつ順番に出題する
・ゲストユーザーの　名前・メッセージ・得点・質問と回答状況　を見ることができる
・検索機能
・イベントのテーマに合わせたデザインを選べる

## ゲストユーザー
・答え合わせ一覧で正解数がみれる（すぐできそうなら最初の実装に含める）
《→得点が見れるので、高得点者にプレセント用意などしてもよい。》
・答え合わせ一覧で名前とメッセージの登録ができる。

## 管理ユーザー
・ゲストメッセージのCRUD

# なぜこのサービスを作りたいのか？
挙式準備でウェルカムスペースの装飾のために、写真をたくさん飾りたい。
どの写真がどこで撮ったものかわかるように飾りたい。
ただ、式場見学で会場を見たきりなので、どこにどう飾るのが良いかわからない。
会場装飾は前日に式場利用者がいれば自分たちでできず、担当プランナーにお願いすることになり、指示する手間が増えてさらに大変。
手軽に写真に説明をつけられ、かつちょっとした演出にできればよいと考えたため。

# スケジュール
- README：〜4/27(火)
- 画面遷移図：〜4/27(火)
- ER図：〜4/27(水)
- メイン機能実装：4/27(水)〜5/5(木)
- 未定（β版をRUNTEQ内リリース（MVP）：〜5/5(木)）
- 未定（本番リリース：〜5/19(木)）
![アイキャッチ](https://user-images.githubusercontent.com/95392247/198525509-243cf545-5f68-49f0-addc-36df13b6812b.png)
### Welcome Quiz Maker
**イベントやお店に来てくれたゲストを**
**写真を使ったオリジナルクイズでおもてなし！**
**話のタネを提供したり、情報発信ができるサービスです。**
##### サービスURL : https://welcome-quiz-maker.com/
##### サービス紹介 : [Welcome Quiz Maker｜Proto Pedia](https://protopedia.net/prototype/3421)
---
### メインのターゲットユーザー
- イベントの主催者
- 待合室がある店舗運営者

### ユーザーの課題
招待したゲストをもてなしたいが、なかなか準備する時間がとれない。
アイスブレイクに使える話題がほしい。
ゲスト・お客様に情報発信したい。

### 解決方法
- スマホに入っている写真で、クイズを簡単に作成する。
- QRコードが自動生成されるため、当日ウェルカムスペースにQRコードを掲示するだけでOK
- ゲストはQRコードから簡単にクイズへ参加可能
- 参加者同士で話のタネにしてもらえる

### なぜこのサービスを作ったのか？
コロナ禍のなか、せっかくの集まる機会なので、
飾った写真　×　思い出クイズ　＝　ゲストに楽しんでもらえる・知ってもらえる
と考えました。
実際に自分の結婚式で使用した結果、わかった？などゲスト同士で会話が生まれ、
私自身もゲストとの話のきっかけにすることができました。

---
### 使用技術
##### フロントエンド
- HTML/SCSS/JavaScript
- CSS frame-work
  - Tailwind CSS
  - daisy UI

##### バックエンド
- Ruby 3.1.2
- Rails 6.1.5.1
  <details>
  <summary>主要なgem</summary>

  ・認証　→　[Sorcery](https://github.com/Sorcery/sorcery)
  ・認可　→　[Pundit](https://github.com/varvet/pundit)
  ・ファイルアップロード　→　[CarrierWave](https://github.com/carrierwaveuploader/carrierwave) / [Fog AWS](https://github.com/fog/fog-aws)
  ・ページネーション　→　[Pagy](https://github.com/ddnexus/pagy)
  </details>　
##### インフラ
- heroku
- PostgreSQL
- Amazon S3　

### 画面遷移図
[figma](https://www.figma.com/file/fQTXVJNUrQCDqXH4WXa2mL/%E8%B3%AA%E5%95%8F?node-id=0%3A1)

### テーブル設計
![テーブル設計](https://user-images.githubusercontent.com/95392247/198523873-5657582d-612c-445e-b045-ee2ea2508240.png)

### 関連リンク
- Twitter [公式アカウント](https://twitter.com/home)

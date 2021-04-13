# Insta Clone app
インスタライクな写真投稿サイトです。<br>
好きな写真をコメント付きで投稿・共有できます。<br>
いいね、お気に入り、ハッシュタグなどSNSでおなじみの機能に加え、プレビュー機能を追加しました。<br>
<img width="500" alt="スクリーンショット 2021-04-13 22 30 46" src="https://user-images.githubusercontent.com/66241426/114560768-ee838400-9ca7-11eb-957a-f8a9c670ccf0.png"><br>
<img width="500" alt="スクリーンショット 2021-04-13 23 26 55" src="https://user-images.githubusercontent.com/66241426/114569249-c26c0100-9caf-11eb-8e72-89ab6c3d8ced.png">
<br>
# URL
https://arcane-stream-03424.herokuapp.com/<br>
「登録する」でページ遷移後、ユーザーネームとメールアドレスの入力で新規登録できます。
<br>
# 使用技術
* ruby 2.7.2
* rails 6.0.3
* AWS (S3)
<br>
# 動作
新規登録後、トップは「Insta Clone Appへようこそ」のページになります。<br>
<img width="500" alt="スクリーンショット 2021-04-13 12 33 17" src="https://user-images.githubusercontent.com/66241426/114492936-88214600-9c54-11eb-9b8b-6506d655aaff.png">
<br>
ボタンをクリックするとユーザー一覧が表示され、フォローができます。<br>
<img width="500" alt="スクリーンショット 2021-04-13 12 33 48" src="https://user-images.githubusercontent.com/66241426/114493226-231a2000-9c55-11eb-9f1f-40d48c0113d4.png">
<br>
フォローしている人が1人以上いる場合、<br>
トップページに「フォローユーザーの投稿」と「自分の投稿」が時系列順で表示されます。<br>
<img width="500" alt="スクリーンショット 2021-04-13 12 40 25" src="https://user-images.githubusercontent.com/66241426/114493400-742a1400-9c55-11eb-8632-c662152724f8.png">
<br>
カメラアイコンから新規投稿できます。<br>
プレビューで画像を確認でき、コメントとハッシュタグを設定できます。<br>
<img width="500" alt="スクリーンショット 2021-04-13 23 01 37" src="https://user-images.githubusercontent.com/66241426/114565492-4623ee80-9cac-11eb-92a1-ab2cf58ece66.png">
<br>
ナビバーの検索フォームからは、<br>
「ユーザーネーム」「フルネーム」「#ハッシュタグ」「ハッシュタグ（#無し）」が検索可能です。<br>
<img width="500" alt="スクリーンショット 2021-04-13 12 16 37" src="https://user-images.githubusercontent.com/66241426/114492281-404def00-9c53-11eb-856a-8d9813ca9116.png">
<br>
ユーザーネームやアイコンをクリックすると、ユーザーの詳細情報を見ることができます。<br>
下部には投稿画像が時系列順で3列表示され、<br>
<img width="500" alt="スクリーンショット 2021-04-13 12 55 06" src="https://user-images.githubusercontent.com/66241426/114494520-7db47b80-9c57-11eb-9973-dc94112fb37e.png">
<br>
本人の場合は保存済みリストのボタンが表示され、クリックするとリストを切り替えることができます。<br>
<img width="500" alt="スクリーンショット 2021-04-13 17 22 59" src="https://user-images.githubusercontent.com/66241426/114520948-ebbf6980-9c7c-11eb-8356-23a4548834e2.png">
<br>
ユーザー詳細ページの3列の画像をクリックすると、投稿がモーダルで表示されます。<br>
<img width="500" alt="スクリーンショット 2021-04-13 13 01 43" src="https://user-images.githubusercontent.com/66241426/114495075-6fb32a80-9c58-11eb-82d2-6d92630f57b0.png">
<br>
他のユーザーにフォローされたり投稿にいいねが付くと、通知アイコンに赤い印がつき、<br>
<img width="500" alt="スクリーンショット 2021-04-13 13 11 32" src="https://user-images.githubusercontent.com/66241426/114496234-7c388280-9c5a-11eb-82fb-a41622532dc5.png">
<br>
通知アイコンをクリックすると内容を確認できます。<br>
<img width="500" alt="スクリーンショット 2021-04-13 13 10 33" src="https://user-images.githubusercontent.com/66241426/114496266-8b1f3500-9c5a-11eb-8578-1859d213b25c.png">
<br>
# 特徴
プロフィール編集で変更後をイメージしやすくするため、アイコンプレビューを設置しました。<br>
<img width="500" alt="スクリーンショット 2021-04-13 12 07 10" src="https://user-images.githubusercontent.com/66241426/114491793-35468f00-9c52-11eb-8352-bab56bd2ca1e.png">
<br>
他のユーザーを見つけやすいように「フォローしていないユーザー」一覧ページを設置しました。<br>
<img width="500" alt="スクリーンショット 2021-04-13 12 09 19" src="https://user-images.githubusercontent.com/66241426/114492055-b736b800-9c52-11eb-83a2-7009ff89a1ba.png">
<br>
# 機能一覧
* ユーザー登録、ログイン機能(devise)
  * 投稿機能（carrierwave）
  * 投稿画像プレビュー機能（Ajax）
  * プロフィール画像プレビュー機能（Ajax）
* ユーザー詳細ページ
  * 投稿、保存リスト切り替え（Ajax）
  * モーダル表示機能（Ajax）
  * フォロー/フォロワー一覧ページ
* コメント機能（Ajax）
* ハッシュタグ機能
* いいね機能（Ajax）
* お気に入り保存機能（Ajax）
* フォロー/フォロワー機能（Ajax）
* ページネーション機能（Kaminari）
* 検索機能
  * フルネーム、ユーザーネーム検索
  * ハッシュタグ検索
* 画像保存機能（fog-aws）
<br>
# 作成者
* genworking
* g.mita0330@gmail.com

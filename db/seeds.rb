require "csv"
CSV.foreach('db/dental_info.csv', headers: true) do |row|
  Clinic.create(
              id: row['id'],
              name: row['name'],
              address: row['address']
              )
end

User.create!(
  name: "admin",
  email: "admin@mail.com",
  password: "password1",
  admin: true,
  address: 1,
  teeth_type: 1,
  orthodontics_type: 1,
)

User.create!(
  name: "hanako",
  email: "hanako@mail.com",
  password: "password2",
  admin: false,
  address: 2,
  teeth_type: 3,
  orthodontics_type: 7,
  profile_image:ActiveStorage::Blob.create_and_upload!(io: File.open("./db/images/woman1.png"), filename: "woman1.png")
)

User.create!(
  name: "yukino",
  email: "yukino@mail.com",
  password: "password3",
  admin: false,
  address: 9,
  teeth_type: 1,
  orthodontics_type: 8,
  profile_image:ActiveStorage::Blob.create_and_upload!(io: File.open("./db/images/woman2.png"), filename: "woman2.png")
)

User.create!(
  name: "maki",
  email: "maki@mail.com",
  password: "password4",
  admin: false,
  address: 1,
  teeth_type: 2,
  orthodontics_type: 1,
  profile_image:ActiveStorage::Blob.create_and_upload!(io: File.open("./db/images/woman3.png"), filename: "woman3.png")
)

User.create!(
  name: "tomomi",
  email: "tomomi@mail.com",
  password: "password5",
  admin: false,
  address: 1,
  teeth_type: 4,
  orthodontics_type: 7,
  profile_image:ActiveStorage::Blob.create_and_upload!(io: File.open("./db/images/woman4.jpg"), filename: "woman4.jpg")
)

User.create!(
  name: "hayato",
  email: "hayato@mail.com",
  password: "password6",
  admin: false,
  address: 1,
  teeth_type: 2,
  orthodontics_type: 2,  profile_image:ActiveStorage::Blob.create_and_upload!(io: File.open("./db/images/man1.jpg"), filename: "man1.jpg")
)

Blog.create!(
  user_id: 2,
  content: "矯正1日目！口の中が違和感、、",
  images:ActiveStorage::Blob.create_and_upload!(io: File.open("./db/images/teeth2.jpg"), filename: "teeth2.jpg")
)

Blog.create!(
  user_id: 2,
  content: "矯正2日目！毎回取り外した時の開放感。口内炎ができて痛い。",
  images:ActiveStorage::Blob.create_and_upload!(io: File.open("./db/images/teeth4.png"), filename: "teeth4.png")
)

Blog.create!(
  user_id: 3,
  content: "今日から2枚目。まあまあの圧迫感。",
  images:ActiveStorage::Blob.create_and_upload!(io: File.open("./db/images/teeth.jpg"), filename: "teeth.jpg")
)

Blog.create!(
  user_id: 3,
  content: "歯が動いているのか、噛み合わせが変わってきて食べるときに違和感がある。",
  images:ActiveStorage::Blob.create_and_upload!(io: File.open("./db/images/teeth.jpg"), filename: "teeth.jpg")
)

Blog.create!(
  user_id: 6,
  content: "前歯は綺麗になってきたけど、奥歯の方がまだ隙間があって気になる。",
  images:ActiveStorage::Blob.create_and_upload!(io: File.open("./db/images/teeth3.jpg"), filename: "teeth3.jpg")
)

BlogComment.create!(
  blog_id: 1,
  user_id: 4,
  content: "一緒に頑張りましょう！"
)

BlogComment.create!(
  blog_id: 1,
  user_id: 5,
  content: "いいね！"
)

BlogComment.create!(
  blog_id: 4,
  user_id: 6,
  content: "わかります(TωT)"
)

BlogComment.create!(
  blog_id: 2,
  user_id: 3,
  content: "口内炎はつらい。"
)

BlogComment.create!(
  blog_id: 2,
  user_id: 4,
  content: "ご飯食べるのが辛くなります。"
)

Bookmark.create!(
  blog_id: 5,
  user_id: 2
)

Bookmark.create!(
  blog_id: 5,
  user_id: 3
)

Bookmark.create!(
  blog_id: 5,
  user_id: 4
)

Bookmark.create!(
  blog_id: 4,
  user_id: 4
)

Bookmark.create!(
  blog_id: 4,
  user_id: 3
)

Review.create!(
  user_id: 2,
  clinic_id: 201,
  quote_price: 96,
  orthodontics_type: 8,
  content: "カウンセリングにいってきましたが3Dシュミレーションがすごかった。親知らずがあるので親知らずの相談もしてきました。矯正期間は1年半程度と言われました。",
  star: 3
)

Review.create!(
  user_id: 3,
  clinic_id: 100,
  quote_price: 40,
  orthodontics_type: 7,
  content: "コロナでマスク生活をしている間に矯正しようと思いカウンセリングに行きました。私は前歯だけだったのでiGOを勧められました。医師の方もキチンと話を聞いてくれ安心しました。まずは大学病院で親知らずを抜く必要があるそうです。",
  star: 3
)

Review.create!(
  user_id: 4,
  clinic_id: 55,
  quote_price: 35,
  orthodontics_type: 7,
  content: "歯と歯の隙間に間を作るために紙一枚分程度に歯の間をやすりがけするらしいです。計画も丁寧に話してくれて安心できました。早く綺麗な歯並びになりたい。",
  star: 2
)

Review.create!(
  user_id: 5,
  clinic_id: 20,
  quote_price: 100,
  orthodontics_type: 7,
  content: "病院内はとても綺麗で落ち着いていました。もし通うことになったら通いやすそう。説明も丁寧でした。親知らず含め抜歯も勧められました。今治療中の虫歯についても聞いてみましたが虫歯の治療が終わってから矯正治療を進めるそうです。",
  star: 3
)

Review.create!(
  user_id: 6,
  clinic_id: 10,
  quote_price: 95,
  orthodontics_type: 2,
  content: "ワイヤー矯正とマウスピースで迷っていましたが、とても丁寧に説明していただけた。期間は2年程度と言われました。",
  star: 3
)


ReviewComment.create!(
  review_id: 1,
  user_id: 4,
  content: "親知らず何本抜くんですか？"
)

ReviewComment.create!(
  review_id: 1,
  user_id: 5,
  content: "いいね！"
)

ReviewComment.create!(
  review_id: 4,
  user_id: 6,
  content: "私も虫歯があるんですけど矯正がしたかったので参考になりました。"
)

ReviewComment.create!(
  review_id: 2,
  user_id: 3,
  content: "矯正の種類って色々あるんですね"
)

ReviewComment.create!(
  review_id: 2,
  user_id: 4,
  content: "抜歯辛い"
)

Like.create!(
  review_id: 5,
  user_id: 2
)

Like.create!(
  review_id: 5,
  user_id: 3
)

Like.create!(
  review_id: 5,
  user_id: 4
)

Like.create!(
  review_id: 4,
  user_id: 4
)

Like.create!(
  review_id: 4,
  user_id: 3
)

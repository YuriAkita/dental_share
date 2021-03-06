class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: %i[google]
  validates :password, presence: true, length: { minimum: 6 }, on: :create
  validates :name, presence: true, uniqueness: true, length: { in: 1..30 }
  validates :email, presence: true, length: { maximum: 255 }, uniqueness: true,
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  has_many :blogs, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :blog_comments, dependent: :destroy
  has_many :review_comments, dependent: :destroy
  has_one_attached :profile_image, dependent: :destroy

  has_many :active_relationships, foreign_key: 'follower_id', class_name: 'Relationship', dependent: :destroy
  has_many :followings, through: :active_relationships, source: :followed

  has_many :passive_relationships, foreign_key: 'followed_id', class_name: 'Relationship', dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :follower

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = 'ゲスト'
      user.uid = SecureRandom.uuid
    end
  end

  def self.admin_guest
    find_or_create_by!(email: 'admin_guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = '管理者'
      user.admin = true
      user.uid = SecureRandom.uuid
    end
  end

  def following?(other_user)
    followings.include?(other_user)
  end

  def self.create_unique_string
    SecureRandom.uuid
  end

  devise :omniauthable, omniauth_providers: %i[twitter google_oauth2]
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.name = auth.info.name
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end

  enum address: { 東京23区内: 1, 東京近郊: 2, 八王子市: 3, 立川市: 4, 武蔵野市: 5, 三鷹市: 6, 青梅市: 7, 府中市: 8, 昭島市: 9, 調布市: 10, 町田市: 11, 小金井市: 12,
                  小平市: 13, 日野市: 14, 東村山市: 15, 国分寺市: 16, 国立市: 17, 福生市: 18, 狛江市: 19, 東大和市: 20, 清瀬市: 21, 東久留米市: 22, 武蔵村山市: 23, 多摩市: 24, 稲城市: 25, 羽村市: 26, あきる野市: 27, 西東京市: 28 }

  enum teeth_type: { 前歯のガタガタやねじれ: 1, すきっ歯: 2, 出っ歯: 3, 一部クロスバイト: 4, 上下の歯の中心ズレ: 5, 上下の歯の噛み合わせ: 6, 全体: 7, その他: 8 }

  enum orthodontics_type: { マウスピース矯正: 1, ワイヤー矯正: 2, ワイヤー裏側矯正: 3, ハーフリンガル矯正（上顎側に裏側矯正、下顎側にワイヤー矯正を施す矯正方法）: 4,
                            コンビネーション矯正（治療の前半をワイヤー矯正、治療の後半をマウスピース矯正）: 5, アソアライナー: 6, インビザライン: 7, インビザラインiGO: 8, インビザラインティーン: 9, インビザライン・エクスプレスパッケージ: 10, インビザライン・ライトパッケージ: 11, イークライナー: 12, アクアシステム: 13, DENマウスピース: 14 }
end

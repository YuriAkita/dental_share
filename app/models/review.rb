class Review < ApplicationRecord
  belongs_to :user
  validates :content, presence: true
  validates :star, presence: true
  validates :orthodontics_type, presence: true
  validates :quote_price, presence: true
  validates :quote_price, inclusion: { in: 1..200, message: '入力できる金額ではありません。1〜200万円の範囲で入力してください。' }
  validate :reservation_at, :date_check
  belongs_to :clinic
  has_many :likes, dependent: :destroy
  has_many :like_users, through: :likes, source: :user
  has_many :review_comments, dependent: :destroy

  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end

  def date_check
    errors.add(:reservation_at, '未来の日付は入力できません。') if !reservation_at.nil? && reservation_at.future?
  end

  enum orthodontics_type: { マウスピース矯正: 1, ワイヤー矯正: 2, ワイヤー裏側矯正: 3, ハーフリンガル矯正（上顎側に裏側矯正、下顎側にワイヤー矯正を施す矯正方法）: 4,
                            コンビネーション矯正（治療の前半をワイヤー矯正、治療の後半をマウスピース矯正）: 5, アソアライナー: 6, インビザライン: 7, インビザラインiGO: 8, インビザラインティーン: 9, インビザライン・エクスプレスパッケージ: 10, インビザライン・ライトパッケージ: 11, イークライナー: 12, アクアシステム: 13, DENマウスピース: 14 }

  enum star: { 不満: 1, やや不満: 2, ある程度満足: 3, 満足: 4, 大満足: 5 }
end

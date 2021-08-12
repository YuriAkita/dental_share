class Review < ApplicationRecord
  belongs_to :user
  validates :content, presence: true
  validates :star, presence: true
  validates :orthodontics_type, presence: true
  validates :quote_price, presence: true
  validates_inclusion_of :quote_price, in:1..200, message: "入力できる金額ではありません。"
  validate :reservation_at, :date_check
  belongs_to :clinic
  has_many :likes, dependent: :destroy
  has_many :like_users, through: :likes, source: :user
  has_many :review_comments, dependent: :destroy
  has_many_attached :images, dependent: :destroy

  def date_check
    unless reservation_at.nil?
      if reservation_at.future?
        errors.add(:reservation_at, "未来の日付は入力できません。")
      end
    end
    errors.add(:reservation_at, "を入力してください。")
  end

  enum orthodontics_type: { マウスピース矯正: 1, ワイヤー矯正: 2, ワイヤー裏側矯正: 3, ハーフリンガル矯正（上顎側に裏側矯正、下顎側にワイヤー矯正を施す矯正方法）: 4, コンビネーション矯正（治療の前半をワイヤー矯正、治療の後半をマウスピース矯正）: 5, アソアライナー: 6, インビザライン: 7, インビザラインiGO: 8, インビザラインティーン: 9, インビザライン・エクスプレスパッケージ: 10, インビザライン・ライトパッケージ: 11, イークライナー: 12, アクアシステム: 13, DENマウスピース: 14 }

  enum star: { 不満:1, やや不満:2, ある程度満足:3, 満足:4, 大満足: 5 }
end

class Review < ApplicationRecord
  belongs_to :user
  validates :content, presence: true
  has_many_attached :images

  enum orthodontics_type: { マウスピース矯正: 1, ワイヤー矯正: 2, ワイヤー裏側矯正: 3, ハーフリンガル矯正（上顎側に裏側矯正、下顎側にワイヤー矯正を施す矯正方法）: 4, コンビネーション矯正（治療の前半をワイヤー矯正、治療の後半をマウスピース矯正）: 5, アソアライナー: 6, インビザライン: 7, インビザラインiGO: 8, インビザラインティーン: 9, インビザライン・エクスプレスパッケージ: 10, インビザライン・ライトパッケージ: 11, イークライナー: 12, アクアシステム: 13, DENマウスピース: 14 }

  enum star: { 大満足: 4, 満足: 3, ある程度満足: 2, やや不満: 1, 不満: 0 }
end

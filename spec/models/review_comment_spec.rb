require 'rails_helper'

RSpec.describe ReviewComment, type: :model do
  describe 'レビューコメント機能' do
    context 'レビューコメントのcontentが空の場合' do
      it 'バリデーションが通らない' do
        user = FactoryBot.create(:user)
        review = review = Review.new(user: user, content: "test", star: 1, orthodontics_type: 1, quote_price: 1, reservation_at: "002020-07-01")
        review_comment = ReviewComment.new(content: "")
        expect(review_comment).not_to be_valid
      end
    end
  end
end

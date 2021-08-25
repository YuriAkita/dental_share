require 'rails_helper'

RSpec.describe Review, type: :model do
  describe 'レビュー機能' do
    context 'レビューのcontentが空の場合' do
      it 'バリデーションが通らない' do
        user = FactoryBot.create(:user)
        review = Review.new(user: user, content: '', star: 1, orthodontics_type: 1, quote_price: 1,
                            reservation_at: '002020-07-01')
        expect(review).not_to be_valid
      end
    end

    context 'レビューのstarが空の場合' do
      it 'バリデーションが通らない' do
        user = FactoryBot.create(:user)
        review = Review.new(user: user, content: 'test', star: nil, orthodontics_type: 1, quote_price: 1,
                            reservation_at: '002020-07-01')
        expect(review).not_to be_valid
      end
    end

    context 'レビューのorthodontics_typeが空の場合' do
      it 'バリデーションが通らない' do
        user = FactoryBot.create(:user)
        review = Review.new(user: user, content: 'test', star: 1, orthodontics_type: nil, quote_price: 1,
                            reservation_at: '002020-07-01')
        expect(review).not_to be_valid
      end
    end

    context 'レビューのquote_priceが空の場合' do
      it 'バリデーションが通らない' do
        user = FactoryBot.create(:user)
        review = Review.new(user: user, content: 'test', star: 1, orthodontics_type: 1, quote_price: nil,
                            reservation_at: '002020-07-01')
        expect(review).not_to be_valid
      end
    end

    context 'レビューのquote_priceが1〜200の数字以外の場合' do
      it 'バリデーションが通らない' do
        user = FactoryBot.create(:user)
        review = Review.new(user: user, content: 'test', star: 1, orthodontics_type: 1, quote_price: -1,
                            reservation_at: '002020-07-01')
        expect(review).not_to be_valid
      end
    end

    context 'レビューのreservation_atが未来の日付の場合' do
      it 'バリデーションが通らない' do
        user = FactoryBot.create(:user)
        review = Review.new(user: user, content: 'test', star: 1, orthodontics_type: 1, quote_price: -1,
                            reservation_at: '002030-07-01')
        expect(review).not_to be_valid
      end
    end
  end
end

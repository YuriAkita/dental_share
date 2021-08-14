require 'rails_helper'

RSpec.describe BlogComment, type: :model do

  describe 'ブログコメント機能' do
    context 'ブログコメントのcontentが空の場合' do
      it 'バリデーションが通らない' do
        user = FactoryBot.create(:user)
        blog = FactoryBot.create(:blog, user: user)
        blog_comment = BlogComment.new(content: "")
      end
    end
  end
end

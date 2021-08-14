require 'rails_helper'

RSpec.describe Blog, type: :model do

  describe 'ブログ機能' do
    context 'ブログのcontentが空の場合' do
      it 'バリデーションが通らない' do
        user = FactoryBot.create(:user)
        blog = Blog.new(user: user, content: "", images:ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/spec/fixtures/image/teeth3.jpg"), filename: 'teeth3.jpg'))
        expect(blog).not_to be_valid
      end
    end

    context 'ブログのimagesが空の場合' do
      it 'バリデーションが通らない' do
        user = FactoryBot.create(:user)
        blog = Blog.new(user: user, content: "test", images: nil)
        expect(blog).not_to be_valid
      end
    end
  end
end

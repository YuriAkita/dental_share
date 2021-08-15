require 'rails_helper'

RSpec.describe "Likes", type: :system do
  let!(:user) { FactoryBot.create(:user) }
  let!(:admin_user) { FactoryBot.create(:admin_user) }

  describe 'レビューのいいね機能' do

    before do
      visit new_user_session_path
      fill_in 'user[email]', with: 'test1@email.com'
      fill_in 'user[password]', with: 'test123'
      click_button 'commit'
    end

    context '自分以外のレビューの詳細画面でいいねをした場合' do
      it 'レビューいいね一覧にいいねをしたレビューが表示される' do
        visit reviews_path
        click_link "review_index_show-3"
        sleep(2)
        click_link "お気に入りする"
        visit reviews_path
        expect(page).to have_content '医療法人社団有秀会 名執歯科'
      end
    end

    context '既にいいね済のレビューをいいね解除した場合' do
      it 'いいね一覧にいいねをしていたレビュー記事が削除される' do
        visit reviews_path
        click_link "review_index_show-4"
        sleep(2)
        click_link "お気に入りする"
        click_link "review_index_show-4"
        sleep(2)
        click_link "お気に入り解除する"
        visit likes_path
        expect(page).not_to have_content '海上ビルデンタルクリニック
カウンセリング'
      end
    end
  end
end

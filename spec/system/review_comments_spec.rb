require 'rails_helper'

RSpec.describe "ReviewComments", type: :system do
  let!(:user) { FactoryBot.create(:user) }

  describe 'レビューのコメント機能' do

    before do
      visit new_user_session_path
      fill_in 'user[email]', with: 'test1@email.com'
      fill_in 'user[password]', with: 'test123'
      click_button 'commit'
    end

    context 'レビュー詳細画面上でコメントを新規作成した場合' do
      it 'レビュー詳細画面に作成したコメントが表示される' do
        visit reviews_path
        sleep(1)
        click_link "review_index_show-1"
        sleep(1)
        fill_in 'review_comment[content]', with: 'test_comment'
        click_button 'コメントを投稿'
        expect(page).to have_content 'test_comment'
      end
    end

    context 'レビュー詳細画面上でコメントを編集した場合' do
      it 'レビュー詳細画面に編集したコメントが表示される' do
        visit new_review_path
        fill_in "review[reservation_at]", with: "002020-7-30"
        fill_in "review[quote_price]", with: '10'
        select 'インビザライン', from: 'review_orthodontics_type'
        fill_in 'review_content', with: 'review_comment_test'
        select '不満', from: 'review_star'
        click_button 'commit'
        visit reviews_path
        click_link "review_index_show-6"
        sleep(1)
        fill_in 'review_comment[content]', with: 'test_comment'
        click_button 'コメントを投稿'
        (all(".select-btn")[0]).click
        fill_in "review_comment_content_6", with: 'test_comment_change'
        click_button 'コメントを更新する'
        sleep(1)
        expect(page).to have_content 'test_comment_change'
      end
    end
  end

end

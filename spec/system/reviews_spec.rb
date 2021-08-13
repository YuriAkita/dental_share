require 'rails_helper'

RSpec.describe "Reviews", type: :system do
  let!(:user) { FactoryBot.create(:user) }
  let!(:review) { FactoryBot.create(:review, user: user) }

  before do
    visit new_user_session_path
    fill_in 'user[email]', with: 'test1@email.com'
    fill_in 'user[password]', with: 'test123'
    click_button 'commit'
    visit reviews_path
  end

  describe '新規作成機能' do
    context 'レビューを新規作成した場合' do
      it 'レビュー一覧へ画面遷移し作成したブログが表示される' do
        visit new_review_path
      end
    end
  end
end

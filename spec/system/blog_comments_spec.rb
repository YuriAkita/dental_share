require 'rails_helper'

RSpec.describe "BlogComments", type: :system do
  let!(:admin_user) { FactoryBot.create(:admin_user) }

  describe '日記のコメント機能' do

    before do
      visit new_user_session_path
      fill_in 'user[email]', with: 'test1@email.com'
      fill_in 'user[password]', with: 'test123'
      click_button 'commit'
    end

    context '日記詳細画面上でコメントを新規作成した場合' do
      it '日記詳細画面に作成したコメントが表示される' do
        blog = FactoryBot.create(:blog, content: "blog_bookmark_test", user: admin_user)
        visit blogs_path
        click_link "blog_index_show-#{blog.id}"
        fill_in 'blog_comment[content]', with: 'test_comment'
        click_button 'コメントを投稿'
        expect(page).to have_content 'test_comment'
      end
    end
  end



end

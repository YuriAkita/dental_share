require 'rails_helper'

RSpec.describe 'BlogComments', type: :system do
  let!(:admin_user) { FactoryBot.create(:admin_user) }
  let!(:user) { FactoryBot.create(:user) }
  let(:blog) { FactoryBot.create(:blog, user: user) }

  describe '日記のコメント機能' do
    before do
      visit new_user_session_path
      fill_in 'user[email]', with: 'test1@email.com'
      fill_in 'user[password]', with: 'test123'
      click_button 'commit'
    end

    context '日記詳細画面上でコメントを新規作成した場合' do
      it '日記詳細画面に作成したコメントが表示される' do
        blog = FactoryBot.create(:blog, content: 'blog_comment_test', user: user)
        visit blogs_path
        click_link "blog_index_show-#{blog.id}"
        fill_in 'blog_comment[content]', with: 'test_comment'
        click_button 'コメントを投稿'
        expect(page).to have_content 'test_comment'
      end
    end

    context '日記詳細画面上でコメントを編集した場合' do
      it '日記詳細画面に編集したコメントが表示される' do
        blog = FactoryBot.create(:blog, content: 'blog_bookmark_test', user: user)
        comment = FactoryBot.create(:blog_comment, blog: blog, user: user)
        visit blogs_path
        click_link "blog_index_show-#{blog.id}"
        fill_in 'blog_comment[content]', with: 'test_comment'
        click_button 'コメントを投稿'
        click_link "blog_comment_edit-#{comment.id}"
        fill_in "blog_comment_content_#{comment.id}", with: 'test_comment_change'
        click_button 'コメントを更新する'
        sleep(1)
        expect(page).to have_content 'test_comment_change'
      end
    end
  end
end

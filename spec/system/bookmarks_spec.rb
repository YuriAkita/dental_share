require 'rails_helper'

RSpec.describe 'Bookmarks', type: :system do
  let!(:user) { FactoryBot.create(:user) }
  let!(:admin_user) { FactoryBot.create(:admin_user) }
  let(:blog) { FactoryBot.create(:blog, user: user) }

  describe '日記のブックマーク機能' do
    before do
      visit new_user_session_path
      fill_in 'user[email]', with: 'test1@email.com'
      fill_in 'user[password]', with: 'test123'
      click_button 'commit'
    end

    context '自分以外の日記の詳細画面でブックマークをした場合' do
      it '日記ブックマーク一覧にブックマークをした日記が表示される' do
        blog = FactoryBot.create(:blog, content: 'blog_bookmark_test', user: admin_user)
        visit blogs_path
        click_link "blog_index_show-#{blog.id}"
        click_link 'ブックマークする'
        visit bookmarks_path
        expect(page).to have_content 'blog_bookmark_test'
      end
    end

    context '既にブックマーク済の日記をブックマーク解除した場合' do
      it '日記ブックマーク一覧にブックマークをしていた日記が削除される' do
        blog = FactoryBot.create(:blog, content: 'blog_bookmark_test', user: admin_user)
        visit blogs_path
        click_link "blog_index_show-#{blog.id}"
        click_link 'ブックマークする'
        visit blogs_path
        click_link "blog_index_show-#{blog.id}"
        click_link 'ブックマーク解除する'
        visit bookmarks_path
        expect(page).not_to have_content 'blog_bookmark_test'
      end
    end
  end
end

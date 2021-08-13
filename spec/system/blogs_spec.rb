require 'rails_helper'

RSpec.describe "Blogs", type: :system do
  let!(:user) { FactoryBot.create(:user) }
  let!(:admin_user) { FactoryBot.create(:admin_user) }
  let(:blog) { FactoryBot.create(:blog, user: user) }

  describe 'CRUD機能' do

    before do
      visit new_user_session_path
      fill_in 'user[email]', with: 'test1@email.com'
      fill_in 'user[password]', with: 'test123'
      click_button 'commit'
    end

    context '日記を新規作成した場合' do
      it '日記一覧へ遷移し作成したタスクが表示される' do
        visit new_blog_path
        fill_in 'blog[content]', with: 'test_content'
        attach_file 'blog[images][]', "#{Rails.root}/spec/fixtures/image/teeth3.jpg"
        click_button 'commit'
        expect(page).to have_content 'test_content'
        expect(page).to have_content '日記一覧'
        expect(page).to have_selector("img[src$='teeth3.jpg']")
      end
    end

    context '一覧画面に遷移した場合' do
      it '作成済みのブログ一覧が表示される' do
        blog = FactoryBot.create(:blog, content: 'blog_index_test',user: user)
        visit blogs_path
        expect(page).to have_content blog.content
      end
    end

    context '既存の日記を編集した場合' do
      it '編集した内容が反映される' do
        blog = FactoryBot.create(:blog, user: user)
        visit blogs_path
        click_link "blog_index_edit-#{blog.id}"
        fill_in 'blog[content]', with: 'blog_edit_content_test'
        click_button 'commit'
        expect(page).to have_content 'blog_edit_content_test'
      end
    end

    context '既存の日記を詳細表示した場合' do
      it '選択した詳細内容が反映される' do
        blog = FactoryBot.create(:blog, content: "blog_show_test", user: user)
        visit blogs_path
        click_link "blog_index_show-#{blog.id}"
        expect(page).to have_content 'blog_show_test'
      end
    end

    context '既存の日記を削除した場合' do
      it '削除した内容が削除される' do
        blog = FactoryBot.create(:blog, content: "blog_delete_test",user: user)
        visit blogs_path
        click_link "blog_index_delete-#{blog.id}"
        page.driver.browser.switch_to.alert.accept
        expect(page).to_not have_content 'blog_delete_test'
      end
    end
  end

  describe '検索機能' do

    before do
      visit new_user_session_path
      fill_in 'user[email]', with: 'test1@email.com'
      fill_in 'user[password]', with: 'test123'
      click_button 'commit'
    end

    context '地域別で検索をした場合' do
      it "地域に完全一致する日記が絞り込まれる" do
        blog = FactoryBot.create(:blog, content: "blog_address_search_test", user: admin_user)
        blog = FactoryBot.create(:blog, content: "blog_address_search_test", user: user)
        visit blogs_path
        select '東京23区内', from: 'q_user_address_eq'
        click_button '検索'
        expect(page).to have_content '東京23区内'
      end
    end

    context '矯正方法別で検索をした場合' do
      it "矯正方法に完全一致する日記が絞り込まれる" do
        blog = FactoryBot.create(:blog, content: "blog_orthodontics_type_search_test", user: admin_user)
        blog = FactoryBot.create(:blog, content: "blog_orthodontics_type_search_test", user: user)
        visit blogs_path
        select 'インビザライン', from: 'q_user_orthodontics_type_eq'
        click_button '検索'
        expect(page).to have_content 'インビザライン'
      end
    end

    context '歯の悩み別で検索をした場合' do
      it "歯の悩み別に完全一致する日記が絞り込まれる" do
        blog = FactoryBot.create(:blog, content: "blog_steeth_type_earch_test", user: admin_user)
        blog = FactoryBot.create(:blog, content: "blog_steeth_type_earch_test", user: user)
        visit blogs_path
        select '出っ歯', from: 'q_user_teeth_type_eq'
        click_button '検索'
        expect(page).to have_content '出っ歯'
      end
    end

    context '地域別かつ矯正方法別かつ歯の悩み別で検索をした場合' do
      it "全ての検索条件に完全一致する日記が絞り込まれる" do
        blog = FactoryBot.create(:blog, content: "blog_all_earch_test", user: admin_user)
        blog = FactoryBot.create(:blog, content: "blog_all_earch_test", user: user)
        visit blogs_path
        select '東京23区内', from: 'q_user_address_eq'
        select 'インビザライン', from: 'q_user_orthodontics_type_eq'
        select '出っ歯', from: 'q_user_teeth_type_eq'
        click_button '検索'
        expect(page).to have_content '東京23区内'
        expect(page).to have_content 'インビザライン'
        expect(page).to have_content '出っ歯'
      end
    end


  end


end

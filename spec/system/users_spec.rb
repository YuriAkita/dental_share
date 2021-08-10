require 'rails_helper'

RSpec.describe 'ログインとログアウト', type: :system do

  describe 'ユーザ登録' do

    context 'ユーザの新規登録をした場合' do
      it 'ユーザの新規作成ができる' do
        visit new_user_registration_path
        fill_in 'user[name]', with: 'akita_yuri'
        fill_in 'user[email]', with: 'akita_yuri@email.com'
        fill_in 'user[password]', with: 'yuridayo'
        fill_in 'user[password_confirmation]', with: 'yuridayo'
        select '東京24区内', from: 'user[address]'
        select '出っ歯', from: 'user[teeth_type]'
        select 'マウスピース矯正', from: 'user[orthodontics_type]'
        click_button 'commit'
        expect(page).to have_content 'アカウント登録が完了しました。'
      end
    end

    context 'ユーザがログインせずブログ一覧画面に飛ぼうとした場合' do
      it 'ログイン画面に遷移する' do
        visit blogs_path
        expect(page).to have_link "ログイン"
      end
    end
  end

  describe 'ユーザーログイン機能' do

    let!(:user) { FactoryBot.create(:user) }
    let!(:second_user) { FactoryBot.create(:second_user) }

    context 'ユーザー登録を既にしている場合' do
      it 'ログインができる' do
        visit new_user_session_path
        fill_in 'user[email]', with: 'test1@email.com'
        fill_in 'user[password]', with: 'test123'
        click_button 'commit'
        expect(page).to have_content 'ログインしました。'
      end
    end

    before do
      visit new_user_session_path
      fill_in 'user[email]', with: 'test1@email.com'
      fill_in 'user[password]', with: 'test123'
      click_button 'commit'
    end

    context 'ユーザー詳細画面に遷移した場合' do
      it 'ユーザー詳細画面を表示する' do
        visit user_path(user.id)
        expect(page).to have_content 'test1のマイページ'
      end
    end
  end

end

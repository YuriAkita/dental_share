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
        select '東京23区内', from: 'user[address]'
        select '出っ歯', from: 'user[teeth_type]'
        select 'マウスピース矯正', from: 'user[orthodontics_type]'
        click_button 'commit'
        expect(page).to have_content 'アカウント登録が完了しました。'
      end
    end

    context 'ユーザがログインせずブログ一覧画面に飛ぼうとした場合' do
      it 'ログイン画面に遷移する' do
        visit blogs_path
        expect(page).to have_link 'ログイン'
      end
    end
  end

  describe 'ユーザーログイン機能' do
    let!(:user) { FactoryBot.create(:user) }
    let!(:second_user) { FactoryBot.create(:admin_user) }

    context 'ユーザー登録を既にしている場合' do
      it 'ログインができる' do
        find('.uk-navbar-right').native.click
        click_link 'ログアウト'
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

    context 'ログインユーザーがログアウトした場合' do
      it 'ログアウトができる' do
        find('.uk-navbar-right').native.click
        click_link 'ログアウト'
        expect(page).to have_content 'ログアウトしました'
      end
    end
  end

  describe '管理画面' do
    let!(:user) { FactoryBot.create(:user) }
    let!(:admin_user) { FactoryBot.create(:admin_user) }

    context '管理ユーザーがログインした場合' do
      it '管理画面にアクセスができる' do
        visit new_user_session_path
        fill_in 'user[email]', with: 'admin_user@mail.com'
        fill_in 'user[password]', with: '9999999'
        click_button 'commit'
        visit rails_admin_path
        expect(page).to have_content 'サイト管理'
      end
    end
  end

  describe 'ゲストログイン機能' do
    context 'ログインしていない状態で管理者ゲストログインをした場合' do
      it 'ログインができる' do
        visit new_user_session_path
        click_link '管理者ゲストログイン'
        expect(page).to have_content 'ゲスト管理者ユーザーとしてログインしました。'
      end
    end

    context 'ログインしていない状態でゲストログインをした場合' do
      it 'ログインができる' do
        visit new_user_session_path
        click_link 'ゲストログイン'
        expect(page).to have_content 'ゲストユーザーとしてログインしました。'
      end
    end
  end
end

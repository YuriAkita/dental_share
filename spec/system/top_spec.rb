require 'rails_helper'

RSpec.describe 'Tops', type: :system do
  describe 'ログイン画面へ遷移機能' do
    context 'Log inのボタンをクリックした場合' do
      it 'ログイン画面に遷移する' do
        visit root_path
        click_link 'Log in'
        expect(page).to have_content 'ログイン'
      end
    end
  end

  describe 'アカウント登録画面へ遷移機能' do
    context 'Create Accountのボタンをクリックした場合' do
      it 'アカウント登録画面に遷移する' do
        visit root_path
        click_link 'Create Account'
        expect(page).to have_content 'アカウント登録'
      end
    end
  end
end

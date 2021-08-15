require 'rails_helper'

RSpec.describe "Reviews", type: :system do
  let!(:user) { FactoryBot.create(:user) }
  # let!(:review) { FactoryBot.create(:review, user: user) }

  describe 'CRUD機能' do

    before do
      visit new_user_session_path
      fill_in 'user[email]', with: 'test1@email.com'
      fill_in 'user[password]', with: 'test123'
      click_button 'commit'
      visit reviews_path
    end

    context 'レビューを新規作成した場合' do
      it 'レビュー一覧へ画面遷移し作成したレビューが表示される' do
        visit new_review_path
        fill_in "review[reservation_at]", with: "002020-7-30"
        fill_in "review[quote_price]", with: '10'
        select 'インビザライン', from: 'review_orthodontics_type'
        fill_in 'review_content', with: 'review_test'
        select '不満', from: 'review_star'
        click_button 'commit'
        expect(page).to have_content '花泉歯科医院'
        expect(page).to have_content '2020/07/30'
        expect(page).to have_content 10
        expect(page).to have_content 'インビザライン'
        expect(page).to have_content 'review_test'
        expect(page).to have_content '不満'
      end
    end

    context 'レビューを編集した場合' do
      it '編集したレビューが表示される' do
        visit new_review_path
        fill_in "review[reservation_at]", with: "002020-7-30"
        fill_in "review[quote_price]", with: '10'
        select 'インビザライン', from: 'review_orthodontics_type'
        fill_in 'review_content', with: 'review_test'
        select '不満', from: 'review_star'
        click_button 'commit'
        all(".select-btn")[1].click
        fill_in "review[reservation_at]", with: "002020-7-30"
        fill_in "review[quote_price]", with: '10'
        select 'インビザライン', from: 'review_orthodontics_type'
        fill_in 'review_content', with: 'review_edit_test'
        select '不満', from: 'review_star'
        click_button 'commit'
        expect(page).to have_content '花泉歯科医院'
        expect(page).to have_content '2020/07/30'
        expect(page).to have_content 10
        expect(page).to have_content 'インビザライン'
        expect(page).to have_content 'review_edit_test'
        expect(page).to have_content '不満'
      end
    end

    context 'レビューの詳細画面へ移動した場合' do
      it '選択したレビューが表示される' do
        visit reviews_path
        click_link "review_index_show-1"
        expect(page).to have_content 96
        expect(page).to have_content 'インビザラインiGO'
        expect(page).to have_content 'カウンセリングにいってきましたが3Dシュミレーションがすごかった。親知らずがあるので親知らずの相談もしてきました。矯正期間は1年半程度と言われました。'
        expect(page).to have_content 'ある程度満足'
      end
    end

    context 'レビューを削除した場合' do
      it '選択したレビューが削除される' do
        visit new_review_path
        fill_in "review[reservation_at]", with: "002020-7-30"
        fill_in "review[quote_price]", with: '10'
        select 'インビザライン', from: 'review_orthodontics_type'
        fill_in 'review_content', with: 'review_delete_test'
        select '不満', from: 'review_star'
        click_button 'commit'
        all(".select-btn")[2].click
        page.driver.browser.switch_to.alert.accept
        expect(page).to_not have_content 'review_delete_test'
      end
    end

    context 'レビューを一覧表示した場合' do
      it 'レビューが表示される' do
        visit reviews_path
        expect(all(".article-area").count).to eq Review.count
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
      it "地域に完全一致するレビューが絞り込まれる" do
        visit reviews_path
        select '東京23区内', from: 'q_user_address_eq'
        click_button '検索'
        expect(all(".address").count).to eq 3
      end
    end

    context '歯列矯正方法別で検索をした場合' do
      it "歯列矯正方法に完全一致するレビューが絞り込まれる" do
        visit reviews_path
        select 'ワイヤー矯正', from: 'q_orthodontics_type_eq'
        click_button '検索'
        expect(all(".article-area").count).to eq 1
      end
    end

    context '歯の悩み別で検索をした場合' do
      it "歯の悩みに完全一致するレビューが絞り込まれる" do
        visit reviews_path
        select '出っ歯', from: 'q_user_teeth_type_eq'
        click_button '検索'
        expect(all(".article-area").count).to eq 1
      end
    end

    context '地域別かつ矯正方法別かつ歯の悩み別で検索をした場合' do
      it "全ての検索条件に完全一致するレビューが絞り込まれる" do
        visit reviews_path
        select '東京23区内', from: 'q_user_address_eq'
        select 'すきっ歯', from: 'q_user_teeth_type_eq'
        select 'インビザライン', from: 'q_orthodontics_type_eq'
        click_button '検索'
        expect(all(".article-area").count).to eq 1
      end
    end
  end
end

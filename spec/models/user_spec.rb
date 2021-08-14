require 'rails_helper'

describe 'ユーザー機能', type: :model do
  let!(:user) { FactoryBot.create(:user) }

  context 'ユーザーのパスワードが空の場合' do
    it 'バリデーションが通らない' do
      user = User.new(name: "", email: "test1@email.com", password: "", address: 1, teeth_type: 3, orthodontics_type: 7 )
      expect(user).not_to be_valid
    end
  end

  context 'ユーザーのパスワードが6文字以下の場合' do
    it 'バリデーションが通らない' do
      user = User.new(name: "test1", email: "test1@email.com", password: "test", address: 1, teeth_type: 3, orthodontics_type: 7 )
      expect(user).not_to be_valid
    end
  end

  context 'ユーザーのnameが空の場合' do
    it 'バリデーションが通らない' do
      user = User.new(name: "", email: "test1@email.com", password: "test123", address: 1, teeth_type: 3, orthodontics_type: 7 )
      expect(user).not_to be_valid
    end
  end

  context 'ユーザーのnameが30文字以上の場合' do
    it 'バリデーションが通らない' do
      user = User.new(name: "test"*10, email: "test1@email.com", password: "test123", address: 1, teeth_type: 3, orthodontics_type: 7 )
      expect(user).not_to be_valid
    end
  end

  context 'ユーザーのnameが既に存在しているnameの場合' do
    it 'バリデーションが通らない' do
      user = User.new(name: "akita", email: "test1@email.com", password: "test123", address: 1, teeth_type: 3, orthodontics_type: 7 )
      user = User.new(name: "akita", email: "test1@email.com", password: "test123", address: 1, teeth_type: 3, orthodontics_type: 7 )
      expect(user).not_to be_valid
    end
  end

  context 'ユーザーのemailが空の場合' do
    it 'バリデーションが通らない' do
      user = User.new(name: "test1", email: "", password: "test123", address: 1, teeth_type: 3, orthodontics_type: 7 )
      expect(user).not_to be_valid
    end
  end

  context 'ユーザーのemailが255文字以上の場合' do
    it 'バリデーションが通らない' do
      user = User.new(name: "test1", email: "test1@email.com"*25, password: "test123", address: 1, teeth_type: 3, orthodontics_type: 7 )
      expect(user).not_to be_valid
    end
  end

  context 'ユーザーのemailが既に存在しているemailの場合' do
    it 'バリデーションが通らない' do
      user = User.new(name: "test1", email: "test1@email.com", password: "test123", address: 1, teeth_type: 3, orthodontics_type: 7 )
      user2 = User.new(name: "test2", email: "test1@email.com", password: "test123", address: 1, teeth_type: 3, orthodontics_type: 7 )
      expect(user).not_to be_valid
    end
  end
end

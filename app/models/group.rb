class Group < ApplicationRecord
  has_many :group_users
  has_many :users, through: :group_users
  has_many :messages

  validates :name, presence: true, uniqueness: true

  def show_last_message
    if (last_message = messages.last).present?
      if last_message.content?
        last_message.content
      else
        '画像が投稿されています'
      end
    else
      'まだメッセージはありません'
    end
  end

end

require 'rails_helper'

describe User do
  describe 'create' do

    it 'nickname、email、passwordとpassword_confirmationが存在すれば登録できること' do
      user = build(:user)
      expect(:user).to be_valid
    end

    
    it 'nicknameがない場合は登録できないこと' do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to inclued("can't be blank")
    end

    it 'emailがない場合は登録できないこと' do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to inclued("can't be blank")
    end

    it 'passwordがない場合は登録できないこと' do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to inclued("can't be blank")
    end

    

    it 'passwordが存在してもpassword_confirmationがない場合は登録できないこと' do
    end
    it 'nicknameが7文字以上であれば登録できないこと' do
    end
    it 'nicknameが6文字以下では登録できること' do
    end
    it '重複したemailが存在する場合登録できないこと' do
      user = create(:user)
      a_user = build(:user, email: user.email)
      a_user.valid?
      expect(a_user.errors(:email)).to inclued("has already been taken")
    end
    it 'passwordが6文字以上であれば登録できること' do 
    end
    it 'passwordが5文字以下であれば登録できないこと' do
      user = build(:user, password: 'aaaaa')
      user.valid
      expect(user.errors(:password)).to inclued('is too short (minimum is 6 characters )')
    end

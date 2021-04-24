require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = build(:user)
  end

  describe 'バリデーション' do
    # 名前、ユーザーネーム、メール、パスワードがあれば有効な状態であること
    it 'is valid with a username, last name, email, and password' do
      @user = User.new(
        name: 'Aaron',
        username: 'Sumner',
        email: 'tester@example.com',
        password: 'dottle-nouveau-pavilion-tights-furze',
        introduction: '',
        phone_number: ''
      )
      expect(@user).to be_valid
    end

    it 'nameが空だとNG' do
      @user.name = ''
      expect(@user.valid?).to eq(false)
    end

    it 'nameが重複するとNG' do
      User.create(
        name: 'Aaron',
        username: 'Sumner',
        email: 'tester@example.com',
        password: 'dottle-nouveau-pavilion-tights-furze'
      )
      @user = User.new(
        name: 'Aaron',
        username: 'Sumner',
        email: 'tester@example.com',
        password: 'dottle-nouveau-pavilion-tights-furze'
      )
      @user.valid?
      expect(@user.errors[:name]).to include("はすでに存在します")
    end

    it 'nameが50文字を超えるとNG' do
      @user.name = 'a' * 51
      expect(@user.valid?).to eq(false)
    end

    it 'usernameが空だとNG' do
      @user.username = ''
      expect(@user.valid?).to eq(false)
    end

    it 'usernameが重複するとNG' do
      User.create(
        name: 'Aaron',
        username: 'Sumner',
        email: 'tester@example.com',
        password: 'dottle-nouveau-pavilion-tights-furze'
      )
      @user = User.new(
        name: 'Aaron',
        username: 'Sumner',
        email: 'tester@example.com',
        password: 'dottle-nouveau-pavilion-tights-furze'
      )
      @user.valid?
      expect(@user.errors[:username]).to include("はすでに存在します")
    end

    it 'usernameが50文字を超えるとNG' do
      str = 'abc'
      @user.username = 'a' * 51
      expect(@user.valid?).to eq(false)
    end

    it 'emailが空だとNG' do
      @user.email = ''
      expect(@user.valid?).to eq(false)
    end

    it 'emailが重複するとNG' do
      User.create(
        name: 'Aaron',
        username: 'Sumner',
        email: 'tester@example.com',
        password: 'dottle-nouveau-pavilion-tights-furze'
      )
      @user = User.new(
        name: 'Aaron',
        username: 'Sumner',
        email: 'tester@example.com',
        password: 'dottle-nouveau-pavilion-tights-furze'
      )
      @user.valid?
      expect(@user.errors[:email]).to include("はすでに存在します")
    end

    it 'passwordが空だとNG' do
      @user.password = ''
      expect(@user.valid?).to eq(false)
    end

    it 'passwordが6文字以上でなければNG' do
      @user.password = 'a' * 5
      expect(@user.valid?).to eq(false)
    end

    it 'introductionが160文字を超えるとNG' do
      @user.introduction = 'a' * 161
      expect(@user.valid?).to eq(false)
    end

    it 'phone_numberが20文字を超えるとNG' do
      @user.phone_number = '1' * 21
      expect(@user.valid?).to eq(false)
    end

    it 'phone_numberが重複するとNG' do
      User.create(
        name: 'Aaron',
        username: 'Sumner',
        email: 'tester@example.com',
        password: 'dottle-nouveau-pavilion-tights-furze',
        phone_number: '01234567890'
      )
      @user = User.new(
        name: 'Aaron',
        username: 'Sumner',
        email: 'tester@example.com',
        password: 'dottle-nouveau-pavilion-tights-furze',
        phone_number: '01234567890'
      )
      @user.valid?
      expect(@user.errors[:phone_number]).to include("はすでに存在します")
    end
  end
end

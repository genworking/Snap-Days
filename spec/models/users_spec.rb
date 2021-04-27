require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = build(:user)
  end

  describe 'バリデーション' do
    it '名前、ユーザーネーム、メール、パスワードがあれば有効な状態であること' do
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
      expect(@user.errors[:name]).to include("はすでに存在します" || "has already been taken")
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
      expect(@user.errors[:username]).to include("はすでに存在します" || "has already been taken")
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
      expect(@user.errors[:email]).to include("はすでに存在します" || "has already been taken")
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
  end

  describe '文字列に一致するフルネームを検索する' do
    context '一致するデータが見つかったとき' do
      it '検索文字列に一致するフルネームのユーザー情報を返すこと' do
        user1 = User.create(
          name: 'Aaron',
          username: 'Sumner',
          email: 'tester@example.com',
          password: 'dottle-nouveau-pavilion-tights-furze'
        )
        user2 = User.create(
          name: 'Joe',
          username: 'Tester',
          email: 'joetester@example.com',
          password: 'dottle-nouveau-pavilion-tights-furze'
        )
        user3 = User.create(
          name: 'Michael',
          username: 'Hartl',
          email: 'michaeltester@example.com',
          password: 'dottle-nouveau-pavilion-tights-furze'
        )
        expect(User.where('name LIKE ?', 'Aaron')).to include(user1)
        expect(User.where('name LIKE ?', 'Aaron')).to_not include(user2, user3)
      end
    end

    context '一致するデータが1件も見つからないとき' do
      it '空のコレクションを返すこと' do
        user1 = User.create(
          name: 'Aaron',
          username: 'Sumner',
          email: 'tester@example.com',
          password: 'dottle-nouveau-pavilion-tights-furze'
        )
        user2 = User.create(
          name: 'Joe',
          username: 'Tester',
          email: 'joetester@example.com',
          password: 'dottle-nouveau-pavilion-tights-furze'
        )
        user3 = User.create(
          name: 'Michael',
          username: 'Hartl',
          email: 'michaeltester@example.com',
          password: 'dottle-nouveau-pavilion-tights-furze'
        )
        expect(User.where('name LIKE ?', 'aaa')).to be_empty
      end
    end
  end

  describe '文字列に一致するユーザーネームを検索する' do
    context '一致するデータが見つかったとき' do
      it '検索文字列に一致するユーザーネームのユーザー情報を返すこと' do
        user1 = User.create(
          name: 'Aaron',
          username: 'Sumner',
          email: 'tester@example.com',
          password: 'dottle-nouveau-pavilion-tights-furze'
        )
        user2 = User.create(
          name: 'Joe',
          username: 'Tester',
          email: 'joetester@example.com',
          password: 'dottle-nouveau-pavilion-tights-furze'
        )
        user3 = User.create(
          name: 'Michael',
          username: 'Hartl',
          email: 'michaeltester@example.com',
          password: 'dottle-nouveau-pavilion-tights-furze'
        )
        expect(User.where('username LIKE ?', 'Sumner')).to include(user1)
        expect(User.where('username LIKE ?', 'Sumner')).to_not include(user2, user3)
      end
    end

    context '一致するデータが1件も見つからないとき' do
      it '空のコレクションを返すこと' do
        user1 = User.create(
          name: 'Aaron',
          username: 'Sumner',
          email: 'tester@example.com',
          password: 'dottle-nouveau-pavilion-tights-furze'
        )
        user2 = User.create(
          name: 'Joe',
          username: 'Tester',
          email: 'joetester@example.com',
          password: 'dottle-nouveau-pavilion-tights-furze'
        )
        user3 = User.create(
          name: 'Michael',
          username: 'Hartl',
          email: 'michaeltester@example.com',
          password: 'dottle-nouveau-pavilion-tights-furze'
        )
        expect(User.where('name LIKE ?', 'aaa')).to be_empty
      end
    end
  end
end

require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = build(:user)
  end

  describe 'バリデーション' do
    it 'フルネーム、ユーザーネーム、メール、パスワードがあれば有効な状態であること' do
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

    context 'nameの文字数制限' do
      it 'nameが50文字を超えるとNG' do
        @user.name = 'a' * 51
        expect(@user.valid?).to eq(false)
      end

      it 'nameが50文字以内であればOK' do
        @user.name = 'a' * 50
        expect(@user.valid?).to eq(true)
      end
    end

    it 'usernameが空だとNG' do
      @user.username = ''
      expect(@user.valid?).to eq(false)
    end

    context 'usernameの文字数制限' do
      it 'usernameが50文字を超えるとNG' do
        @user.username = 'a' * 51
        expect(@user.valid?).to eq(false)
      end

      it 'usernameが50文字以内であればOK' do
        @user.username = 'a' * 50
        expect(@user.valid?).to eq(true)
      end
    end

    it 'emailが空だとNG' do
      @user.email = ''
      expect(@user.valid?).to eq(false)
    end

    it 'passwordが空だとNG' do
      @user.password = ''
      expect(@user.valid?).to eq(false)
    end

    context 'passwordの文字数制限' do
      it 'passwordが6文字以上でなければNG' do
        @user.password = 'a' * 5
        expect(@user.valid?).to eq(false)
      end

      it 'passwordが6文字以上であればOK' do
        @user.password = 'a' * 6
        expect(@user.valid?).to eq(true)
      end
    end

    context 'introductionの文字数制限' do
      it 'introductionが160文字を超えるとNG' do
        @user.introduction = 'a' * 161
        expect(@user.valid?).to eq(false)
      end

      it 'introductionが160文字以内であればOK' do
        @user.introduction = 'a' * 160
        expect(@user.valid?).to eq(true)
      end
    end

    context 'phone_numberの文字数制限' do
      it 'phone_numberが20文字を超えるとNG' do
        @user.phone_number = '1' * 21
        expect(@user.valid?).to eq(false)
      end

      it 'phone_numberが20文字以内であればOK' do
        @user.phone_number = '1' * 20
        expect(@user.valid?).to eq(true)
      end
    end
  end

  describe 'ユニークバリデーション' do
    before do
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
    end

    it 'nameが重複するとNG' do
      @user.valid?
      expect(@user.errors[:name]).to include("はすでに存在します" || "has already been taken")
    end

    it 'usernameが重複するとNG' do
      @user.valid?
      expect(@user.errors[:username]).to include("はすでに存在します" || "has already been taken")
    end

    it 'emailが重複するとNG' do
      @user.valid?
      expect(@user.errors[:email]).to include("はすでに存在します" || "has already been taken")
    end
  end

  describe '文字列に一致するフルネームを検索する' do
    before do
      @user1 = User.create(
        name: 'Aaron',
        username: 'Sumner',
        email: 'tester@example.com',
        password: 'dottle-nouveau-pavilion-tights-furze'
      )
      @user2 = User.create(
        name: 'Joe',
        username: 'Tester',
        email: 'joetester@example.com',
        password: 'dottle-nouveau-pavilion-tights-furze'
      )
    end

    context '一致するデータが見つかったとき' do
      it '検索文字列に一致するフルネームのユーザー情報を返すこと' do
        expect(User.search('Aaron')).to eq(@user1)
        expect(User.search('Aaron')).to_not eq(@user2)
      end
    end

    context '一致するデータが1件も見つからないとき' do
      it 'nilを返すこと' do
        expect(User.search('aaa')).to eq(nil)
      end
    end
  end

  describe '文字列に一致するユーザーネームを検索する' do
    before do
      @user1 = User.create(
        name: 'Aaron',
        username: 'Sumner',
        email: 'tester@example.com',
        password: 'dottle-nouveau-pavilion-tights-furze'
      )
      @user2 = User.create(
        name: 'Joe',
        username: 'Tester',
        email: 'joetester@example.com',
        password: 'dottle-nouveau-pavilion-tights-furze'
      )
    end

    context '一致するデータが見つかったとき' do
      it '検索文字列に一致するユーザーネームのユーザー情報を返すこと' do
        expect(User.search('Sumner')).to eq(@user1)
        expect(User.search('Sumner')).to_not eq(@user2)
      end
    end

    context '一致するデータが1件も見つからないとき' do
      it 'nilを返すこと' do
        expect(User.search('aaa')).to eq(nil)
      end
    end
  end
end

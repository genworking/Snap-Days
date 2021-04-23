require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = build(:user)
  end

  describe 'バリデーション' do
    it 'usernameとnameとemailの値が設定されていればOK' do
      expect(@user.valid?).to eq(true)
    end

    it 'usernameが空だとNG' do
      @user.username = ''
      expect(@user.valid?).to eq(false)
    end

    it 'nameが空だとNG' do
      @user.name = ''
      expect(@user.valid?).to eq(false)
    end

    it 'emailが空だとNG' do
      @user.email = ''
      expect(@user.valid?).to eq(false)
    end
  end
end

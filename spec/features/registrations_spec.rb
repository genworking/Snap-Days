require 'rails_helper'

RSpec.feature "Registrations", type: :feature do
  describe 'ユーザーがプロフィール情報を更新する' do
    scenario '認可されたユーザーであれば、プロフィール編集ページで更新できること' do
      @user = FactoryBot.create(:user)

      visit new_user_session_path
      fill_in "user[email]", with: @user.email
      fill_in "user[password]", with: @user.password
      click_button "commit"

      visit edit_user_registration_path
      fill_in "user[username]", with: "New_name"
      click_button "commit"

      expect(page).to have_content "アカウント情報を変更しました"
      expect(@user.reload.username).to eq "New_name"
    end

    scenario '認可されていないユーザーであれば、サインイン画面に遷移すること' do
      visit edit_user_registration_path

      expect(page).to have_content "アカウント登録もしくはログインしてください"
      expect(page).to have_selector "#sign_in_btn"
    end
  end

  describe 'ユーザーがログアウトをする' do
    scenario 'ログアウトアイコンをクリックすると、ログアウトができること' do
      @user = FactoryBot.create(:user)

      visit new_user_session_path
      fill_in "user[email]", with: @user.email
      fill_in "user[password]", with: @user.password
      click_button "commit"

      find("#logout-icon").click

      expect(page).to have_content "アカウント登録もしくはログインしてください"
      expect(current_path).to eq new_user_session_path
    end
  end
end

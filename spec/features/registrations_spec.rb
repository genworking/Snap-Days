require 'rails_helper'

RSpec.feature "Registrations", type: :feature do
  describe 'ユーザーがプロフィール情報を更新する' do
    scenario '認可されたユーザーであれば更新できること' do
      user = FactoryBot.create(:user)

      visit new_user_session_path
      fill_in "user[email]", with: user.email
      fill_in "user[password]", with: user.password
      click_button "commit"

      visit edit_user_registration_path
      fill_in "user[username]", with: "New name"
      click_button "commit"

      expect(page).to have_content "アカウント情報を変更しました"
      expect(user.reload.username).to eq "New name"
    end
  end
end

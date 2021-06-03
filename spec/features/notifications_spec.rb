require 'rails_helper'

RSpec.feature "Notifications", type: :feature do
  describe 'ユーザーが通知を受け取る' do
    scenario '他のユーザーにフォローされると、通知ページでフォロー内容が表示されること' do
      @user = FactoryBot.create(:user)
      @user2 = FactoryBot.create(:user, :user2)

      visit new_user_session_path
      fill_in "user[email]", with: @user.email
      fill_in "user[password]", with: @user.password
      click_button "commit"

      visit root_path
      find('#start-btn').click
      expect(current_path).to eq first_follow_path
      expect(page).to have_content "Aaron2"

      find("#follow-btn").click
      btn = find("#followed-btn")
      expect(btn[:value]).to eq "  フォロー中  "

      find("#logout-icon").click

      visit new_user_session_path
      fill_in "user[email]", with: @user2.email
      fill_in "user[password]", with: @user2.password
      click_button "commit"

      visit notifications_path
      expect(page).to have_content "Aaron さんが あなたをフォローしました"
    end
  end
end

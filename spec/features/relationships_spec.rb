require 'rails_helper'

RSpec.feature "Relationships", type: :feature do
  describe 'ユーザーをフォローする' do
    scenario '他のユーザーをフォローすると、フォローボタンが「フォロー中」に変わること' do
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

      visit user_path(@user)
      expect(page).to have_content "フォロー 1"
    end
  end
end

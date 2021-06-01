require 'rails_helper'

RSpec.feature "Hashtags", type: :feature do
  describe '検索機能' do
    scenario '名前を検索できること' do
      @user = FactoryBot.create(:user)

      visit new_user_session_path
      fill_in "user[email]", with: @user.email
      fill_in "user[password]", with: @user.password
      click_button "commit"

      fill_in "search", with: @user.name.to_s
      find('#search-btn').click

      expect(page).to have_content @user.name.to_s
    end

    scenario 'ユーザーネームを検索できること' do
      @user = FactoryBot.create(:user)

      visit new_user_session_path
      fill_in "user[email]", with: @user.email
      fill_in "user[password]", with: @user.password
      click_button "commit"

      fill_in "search", with: @user.username.to_s
      find('#search-btn').click

      expect(page).to have_content @user.username.to_s
    end
  end
end

require 'rails_helper'

RSpec.feature "Hashtags", type: :feature do
  describe 'フォーム入力からの検索として' do
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

    scenario 'ハッシュタグを検索できること' do
      @user = FactoryBot.create(:user)

      visit new_user_session_path
      fill_in "user[email]", with: @user.email
      fill_in "user[password]", with: @user.password
      click_button "commit"

      visit new_post_path
      attach_file "post[photos_attributes][0][image]", "#{Rails.root}/spec/factories/images/2.jpeg"
      fill_in "post[caption]", with: "test_caption"
      fill_in "post[hashword]", with: "test_hashword"
      click_button "commit"

      fill_in "search", with: @user.posts.first.hashword
      find('#search-btn').click

      expect(page).to have_content @user.posts.first.hashword.to_s
    end
  end
end

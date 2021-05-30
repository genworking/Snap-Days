require 'rails_helper'

RSpec.feature "Posts", type: :feature do
  describe 'ユーザーが新しい投稿を作成する' do
    scenario '画像とキャプション入力があれば投稿を追加できること' do
      @user = FactoryBot.create(:user)

      visit new_user_session_path
      fill_in "user[email]", with: @user.email
      fill_in "user[password]", with: @user.password
      click_button "commit"

      expect {
        visit new_post_path
        attach_file "post[photos_attributes][0][image]", "#{Rails.root}/spec/factories/images/2.jpeg"
        fill_in "post[caption]", with: "test_caption"
        click_button "commit"

        expect(page).to have_content "投稿が保存されました"
      }.to change(@user.posts, :count).by(1)
    end

    scenario '画像入力が無ければ投稿を追加できないこと' do
      @user = FactoryBot.create(:user)

      visit new_user_session_path
      fill_in "user[email]", with: @user.email
      fill_in "user[password]", with: @user.password
      click_button "commit"

      expect {
        visit new_post_path
        fill_in "post[caption]", with: "test_caption"
        click_button "commit"

        expect(page).to have_content "画像が入力されていません"
      }.to_not change(@user.posts, :count)
    end
  end
end

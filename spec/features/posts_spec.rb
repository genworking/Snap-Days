require 'rails_helper'

RSpec.feature "Posts", type: :feature do
  describe 'ユーザーが新しい投稿を作成する' do
    scenario '画像とキャプションがあれば投稿の保存に成功すること' do
      user = FactoryBot.create(:user)

      visit new_user_session_path
      fill_in "メールアドレス", with: user.email
      fill_in "パスワード", with: user.password
      click_button "ログインする"

      expect {
        visit new_post_path
        find(".ff-btn").click
        attach_file "input_file", "#{Rails.root}/spec/factories/images/2.jpeg"
        fill_in "投稿コメント", with: "test_caption"
        click_button "投稿する"

        expect(page).to have_content "投稿が保存されました"
      }.to change(user.posts, :count).by(1)
    end
  end
end
require 'rails_helper'

RSpec.feature "Posts", type: :feature do
  scenario 'ユーザーが新しい投稿を作成する' do
    user = FactoryBot.create(:user)

    visit new_user_session_path
    fill_in "メールアドレス", with: user.email
    fill_in "パスワード", with: user.password
    click_button "ログインする"

    expect do
      visit new_post_path
      find(".ff-btn").click
      attach_file "input_file", "spec/factories/images/2.jpeg"
      fill_in "投稿コメント", with: "test_caption"
      click_button "投稿する"

      expect(page).to have_content "投稿が保存されました"
    end.to change(user.posts, :count).by(1)
  end
end

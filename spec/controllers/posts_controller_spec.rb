require 'rails_helper'

RSpec.describe Post::PostsController, type: :controller do
  describe '#create' do
    context '認証済みユーザーとして' do
      before do
        @user = FactoryBot.create(:user, :testuser1)
      end

      it '投稿を追加できること' do
        post_params = FactoryBot.attributes_for(:post)
        sign_in @user
        expect {
          post :create, params: { post: post_params }
        }.to change(@user.posts, :count).by(1)
      end
    end

    context "非認証済みユーザーとして" do
      it "302レスポンスを返すこと" do
        post_params = FactoryBot.attributes_for(:post)
        post :create, params: { post: post_params }
        expect(response).to have_http_status "302"
      end

      it "サインイン画面にリダイレクトすること" do
        post_params = FactoryBot.attributes_for(:post)
        post :create, params: { post: post_params }
        expect(response).to redirect_to "/users/sign_in"
      end
    end
  end
end

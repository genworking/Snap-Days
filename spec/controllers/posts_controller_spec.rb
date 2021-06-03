require 'rails_helper'

RSpec.describe Post::PostsController, type: :controller do
  describe '#index' do
    context '認証済みユーザーとして' do
      before do
        @user = FactoryBot.create(:user)
      end

      it '正常にレスポンスを返すこと' do
        sign_in @user
        get :index
        expect(response).to be_successful
      end

      it '200レスポンスを返すこと' do
        sign_in @user
        get :index
        expect(response).to have_http_status "200"
      end
    end
  end

  describe '#show' do
    before do
      @user = FactoryBot.create(:user)
      @post = FactoryBot.create(:post, user: @user)
    end

    it 'html形式でレスポンスを返すこと' do
      sign_in @user
      get :show, format: :html,
                 params: { id: @post.id }
      expect(response.content_type).to eq "text/html"
    end

    context '認可されたユーザーとして' do
      it '正常にレスポンスを返すこと' do
        sign_in @user
        get :show, params: { id: @post.id }
        expect(response).to be_successful
      end

      it '200レスポンスを返すこと' do
        sign_in @user
        get :show, params: { id: @post.id }
        expect(response).to have_http_status "200"
      end
    end

    context '認可されていないユーザーとして' do
      it '302レスポンスを返すこと' do
        get :show, params: { id: @post.id }
        expect(response).to have_http_status "302"
      end
    end
  end

  describe '#destroy' do
    context '認可されたユーザーとして' do
      before do
        @user = FactoryBot.create(:user)
        @post = FactoryBot.create(:post, user: @user)
      end

      it '投稿を削除できること' do
        sign_in @user
        expect {
          delete :destroy, params: { id: @post.id }
        }.to change(@user.posts, :count).by(-1)
      end
    end

    context '認可されていないユーザーとして' do
      before do
        @user = FactoryBot.create(:user)
        other_user = FactoryBot.create(:user, :user2)
        @post = FactoryBot.create(:post, user: other_user)
      end

      it '投稿を削除できないこと' do
        sign_in @user
        expect {
          delete :destroy, params: { id: @post.id }
        }.to_not change(Post, :count)
      end

      it "トップ画面にリダイレクトすること" do
        sign_in @user
        delete :destroy, params: { id: @post.id }
        expect(response).to redirect_to root_path
      end
    end
  end
end

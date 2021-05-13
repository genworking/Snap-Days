require 'rails_helper'

RSpec.describe User::UsersController, type: :controller do
  describe '#index' do
    context '認可されたユーザー' do
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

    context '認可されていないユーザー' do
      it '302レスポンスを返すこと' do
        get :index
        expect(response).to have_http_status "302"
      end

      it 'サインイン画面にリダイレクトすること' do
        get :index
        expect(response).to redirect_to "/users/sign_in"
      end
    end
  end

  describe '#show' do
    context '認可されたユーザーとして' do
      before do
        @user = FactoryBot.create(:user)
      end

      it "正常なレスポンスを返すこと" do
        sign_in @user
        get :show, params: { id: @user }
        expect(response).to be_successful
      end
    end

    context '認可されていないユーザーとして' do
      it '302レスポンスを返すこと' do
        get :index
        expect(response).to have_http_status "302"
      end

      it 'サインイン画面にリダイレクトすること' do
        get :index
        expect(response).to redirect_to "/users/sign_in"
      end
    end
  end
end

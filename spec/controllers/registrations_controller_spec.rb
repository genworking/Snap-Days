require 'rails_helper'

RSpec.describe Devise::RegistrationsController, type: :controller do
  describe '#edit' do
    context '認可されたユーザー' do
      before do
        @user = FactoryBot.create(:user)
      end

      it '正常にレスポンスを返すこと' do
        sign_in @user
        edit_user_registration_path
        expect(response).to be_successful
      end

      it '200レスポンスを返すこと' do
        sign_in @user
        edit_user_registration_path
        expect(response).to have_http_status "200"
      end
    end
  end
end

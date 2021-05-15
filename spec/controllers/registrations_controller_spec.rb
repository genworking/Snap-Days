# require 'rails_helper'
#
# RSpec.describe Users::RegistrationsController, type: :controller do
#   describe "#update" do
#     context "認可されたユーザーとして" do
#       before do
#         @user = FactoryBot.create(:user)
#       end
#
#       it "ユーザー情報を更新できること" do
#         sign_in @user
#         # binding.pry
#         # patch :update, params: { id: @user, username: "new" }
#
#         patch :update, params: { name: 'new' }
#         expect(@user.reload.name).to eq 'new'
#         # expect(@user.name).to eq @user.name
#       end
#     end
#   end
# end

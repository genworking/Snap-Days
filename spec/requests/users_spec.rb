# require 'rails_helper'
#
# RSpec.describe "Users", type: :request do
#   describe "#show" do
#
#     let(:user) { create(:user_with_posts, username: user.username).posts.length }
#     let(:login_user) { login(user) }
#     let(:hoge_user) { create(:user_with_posts, username: "hogehoge")
#                             .posts.length }
#
#     before do
#       # hoge_user(username: "hogehoge")
#       get '/users/:id', params: { id: user.id }
#     end
#
#     it 'ページが正しく表示されていればOK' do
#       expect(response.status).to eq 200
#     end
#
#     it 'レンダーを読み込んでいればOK' do
#       expect(response).to render_template "/posts/show_main"
#       expect(response).to render_template "/posts/show_map"
#       expect(response).to render_template "/posts/show_postlist"
#     end
#
#     it '@userが正しい値であればOK' do
#       expect(assigns(:user)).to eq user
#     end
#   end
# end

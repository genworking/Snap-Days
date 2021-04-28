require 'rails_helper'

RSpec.describe Hashtag, type: :model do
  describe '文字列に一致するハッシュタグの投稿を検索すること' do
    before do
      @user = User.create(
        name: 'Joe',
        username: 'Tester',
        email: 'joetester@example.com',
        password: 'dottle-nouveau-pavilion-tights-furze'
      )
      @post1 = @user.posts.create(
        caption: 'post1_caption',
        hashword: '#test_hashword'
      )
      @post2 = @user.posts.create(
        caption: 'post2_caption',
        hashword: '#test'
      )
      @hashtag1 = Hashtag.find_or_create_by(hashname: @post1.hashword.downcase.delete('#'))
      @hashtag2 = Hashtag.find_or_create_by(hashname: @post2.hashword.downcase.delete('#'))
    end

    context '一致するデータが見つかったとき' do
      it '検索文字列に一致するハッシュタグの投稿を返すこと' do
        expect(Hashtag.search('test_hashword')).to eq(@hashtag1)
        expect(Hashtag.search('test_hashword')).to_not eq(@hashtag2)
      end
    end

    context '一致するデータが1件も見つからないとき' do
      it '空のコレクションを返すこと' do
        expect(Hashtag.search('aaa')).to be_blank
      end
    end
  end
end

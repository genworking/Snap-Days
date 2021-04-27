require 'rails_helper'

RSpec.describe Hashtag, type: :model do
  describe '文字列に一致するハッシュタグを検索する' do
    context '一致するデータが見つかったとき' do
      it '検索文字列に一致するハッシュタグの投稿を返すこと' do
        user = User.create(
          name: 'Joe',
          username: 'Tester',
          email: 'joetester@example.com',
          password: 'dottle-nouveau-pavilion-tights-furze'
        )
        post1 = user.posts.create(
          caption: 'post1_caption',
          hashword: 'test_hashword'
        )
        post2 = user.posts.create(
          caption: 'post2_caption',
          hashword: 'test'
        )
        post3 = user.posts.create(
          caption: 'post3_caption',
          hashword: 'test_hashword'
        )
        expect(Post.where('hashword LIKE ?', 'test_hashword')).to include(post1, post3)
        expect(Post.where('hashword LIKE ?', 'test_hashword')).to_not include(post2)
      end
    end

    context '一致するデータが1件も見つからないとき' do
      it '空のコレクションを返すこと' do
        user = User.create(
          name: 'Joe',
          username: 'Tester',
          email: 'joetester@example.com',
          password: 'dottle-nouveau-pavilion-tights-furze'
        )
        post1 = user.posts.create(
          caption: 'post1_caption',
          hashword: 'test_hashword'
        )
        post2 = user.posts.create(
          caption: 'post2_caption',
          hashword: 'test'
        )
        post3 = user.posts.create(
          caption: 'post3_caption',
          hashword: 'test_hashword'
        )
        expect(Post.where('hashword LIKE ?', 'aaa')).to be_empty
      end
    end
  end
end

require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
  end

  describe 'ファクトリー' do
    it "ファクトリで投稿に関連するユーザーを生成する" do
      puts "[\e[42m投稿の関連ユーザー：#{@post.user.inspect}\e[0m]"
      expect(@post.user.inspect).to include("Aaron")
    end

    it "ファクトリで生成された投稿にhashtagを設定する" do
      post = FactoryBot.build(:post, :with_hashtag)
      expect(post.hashword).to include("hashtag_test")
    end

    it "ファクトリで生成された投稿にaddressを設定する" do
      post = FactoryBot.build(:post, :with_address)
      expect(post.address).to include("address_test")
    end
  end

  describe 'バリデーション' do
    it '有効なファクトリーを持つこと' do
      expect(@post).to be_valid
    end

    it 'キャプションがあれば有効な状態であること' do
      @post = FactoryBot.build(:post, hashword: '', address: '')
      expect(@post).to be_valid
    end

    it 'captionが空だとNG' do
      @post.caption = ''
      expect(@post.valid?).to eq(false)
    end

    context 'captionの文字数制限' do
      it 'captionが2200文字を超えるとNG' do
        @post.caption = 'a' * 2201
        expect(@post.valid?).to eq(false)
      end

      it 'captionが2200文字以内であればOK' do
        @post.caption = 'a' * 2200
        expect(@post.valid?).to eq(true)
      end
    end

    context 'hashwordの文字数制限' do
      it 'hashwordが136文字を超えるとNG' do
        @post.hashword = 'a' * 137
        expect(@post.valid?).to eq(false)
      end

      it 'hashwordが136文字以内であればOK' do
        @post.hashword = 'a' * 136
        expect(@post.valid?).to eq(true)
      end
    end

    context 'addressの文字数制限' do
      it 'addressが92文字を超えるとNG' do
        @post.address = 'a' * 93
        expect(@post.valid?).to eq(false)
      end

      it 'addressが92文字以内であればOK' do
        @post.address = 'a' * 92
        expect(@post.valid?).to eq(true)
      end
    end
  end
end

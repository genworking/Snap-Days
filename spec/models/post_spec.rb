require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'バリデーション' do
    it 'キャプションがあれば有効な状態であること' do
      @post = Post.new(
        caption: 'test caption',
        hashword: '',
        address: ''
      )
      expect(@post).to be_valid
    end

    it 'captionが空だとNG' do
      @post = Post.new(caption: '')
      expect(@post.valid?).to eq(false)
    end

    context 'captionの文字数制限' do
      it 'captionが2200文字を超えるとNG' do
        @post = Post.new(caption: 'a' * 2201)
        expect(@post.valid?).to eq(false)
      end

      it 'captionが2200文字以内であればOK' do
        @post = Post.new(caption: 'a' * 2200)
        expect(@post.valid?).to eq(true)
      end
    end

    context 'hashwordの文字数制限' do
      it 'hashwordが136文字を超えるとNG' do
        @post = Post.new(
          caption: 'test caption',
          hashword: 'a' * 137
        )
        expect(@post.valid?).to eq(false)
      end

      it 'hashwordが136文字以内であればOK' do
        @post = Post.new(
          caption: 'test caption',
          hashword: 'a' * 136
        )
        expect(@post.valid?).to eq(true)
      end
    end

    context 'addressの文字数制限' do
      it 'addressが92文字を超えるとNG' do
        @post = Post.new(
          caption: 'test caption',
          address: 'a' * 93
        )
        expect(@post.valid?).to eq(false)
      end

      it 'addressが92文字以内であればOK' do
        @post = Post.new(
          caption: 'test caption',
          address: 'a' * 92
        )
        expect(@post.valid?).to eq(true)
      end
    end
  end
end

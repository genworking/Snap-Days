require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = build(:post)
  end

  describe 'バリデーション' do
    # キャプションがあれば有効な状態であること
    it 'is valid with a caption' do
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

    it 'captionが2200文字を超えるとNG' do
      @post = Post.new(caption: 'a' * 2201)
      expect(@post.valid?).to eq(false)
    end

    it 'hashwordが136文字を超えるとNG' do
      @post = Post.new(
        caption: 'test caption',
        hashword: 'a' * 137
      )
      expect(@post.valid?).to eq(false)
    end

    it 'addressが92文字を超えるとNG' do
      @post = Post.new(
        caption: 'test caption',
        address: 'a' * 93
      )
      expect(@post.valid?).to eq(false)
    end
  end
end

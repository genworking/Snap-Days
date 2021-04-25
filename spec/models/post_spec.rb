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
  end

  

end

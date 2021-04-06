class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  if Rails.env.development? # 開発環境の場合
    storage :file
  elsif Rails.env.test? # テスト環境の場合
    storage :file
  else # 本番環境の場合
    storage :fog
  end


  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :medium do
    process resize_to_fill: [1080, 1080]
  end

  def extension_whitelist
    %w(jpeg png)
  end
end

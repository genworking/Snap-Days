class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  if Rails.env.development? || Rails.env.test?
    storage :file
  else
    storage :fog
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :medium do
    process resize_to_fill: [1080, 1080]
  end

  def extension_whitelist
    %w[jpeg png]
  end
end

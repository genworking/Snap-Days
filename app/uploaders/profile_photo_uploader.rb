class ProfilePhotoUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  # 画像の上限
  version :medium do
    process resize_to_fill: [300, 300]
  end

  # サムネイルを生成する設定
  version :thumb do
    process :resize_to_limit => [300, 300]
  end

  version :thumb100 do
    process :resize_to_limit => [100, 100]
  end

  version :thumb30 do
    process :resize_to_limit => [30, 30]
  end

  # 入力画像形式の制限
  def extension_white_list
    %w(jpg jpeg gif png)
  end

  # 保存形式
  process :convert => 'jpg'

  # 拡張子が同じでないと、GIFをJPGなどにコンバートできないため、ファイル名を変更
  def filename
    super.chomp(File.extname(super)) + '.jpg' if original_filename.present?
  end

  # ファイル名を日付にするとタイミングのせいでサムネイル名がずれる
  #ファイル名はランダムで一意になる
  def filename
    "#{secure_token}.#{file.extension}" if original_filename.present?
  end

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
end

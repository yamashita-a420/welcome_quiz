class PhotoUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  if Rails.env.production?
    storage :fog # 本番環境のみ
  else
    storage :file # 本番環境以外
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url
    'photo_image.png'
  end

  process resize_to_fit: [500, 500]

  def extension_whitelist
    %w(jpg jpeg gif png)
  end
end

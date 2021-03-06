class PhotoUploader < CarrierWave::Uploader::Base
  if Rails.env.production?
    storage :fog # 本番環境のみ
  else
    storage :file # 本番環境以外
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url
    'photo_image.jpg'
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end
end

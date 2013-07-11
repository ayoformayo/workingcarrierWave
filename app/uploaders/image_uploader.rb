class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  
  storage :file
  def stor_dir
  	'../public/photos'
  end
  # process :resize_to_fill => [200, 200]

  def extension_white_list
    %w(jpg jpeg gif png)
  end
  
  
end
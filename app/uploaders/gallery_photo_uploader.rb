class GalleryPhotoUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  process :full_quality

  def full_quality
    self.class.process :resize_to_fit => Dust.config.full_image_dimensions
  end

  version :thumb do
    process :create_thumb
  end

  def create_thumb
    self.class.process :resize_to_fill => Dust.config.thumb_image_dimensions
  end

end


class GalleryPhotoUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  process :dust_resize_to_fit

  version :thumb do
    process :dust_resize_to_fill
  end

  def dust_resize_to_fit
    resize_to_fit *(Dust.config.full_image_dimensions)
  end

  def dust_resize_to_fill
    resize_to_fill *(Dust.config.thumb_image_dimensions)
  end

end
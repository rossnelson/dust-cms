Dust.configure do |dust|

  # => rendered within the front_end layout
  #     regions are wrappers for groups of blocks
  dust.config.regions = ['header-one', 'header-two', 'content-default', 'footer-one', 'footer-two']
  #     each new page will be created along with a block that renders within the defined default_region
  dust.config.default_region = 'content-default'

  # => inserts the rendered page view content after the defined region
  dust.config.insert_yield_after = 'content-default'

  # => redirects the defined page to the root_url
  dust.config.root = 'welcome'
  
  # => :actions => [contact_confirmation, contact_request]
  dust.config.mailer = PostOffice

  # => :resize_to_fit => [620, 358], :thumb => process :resize_to_fill => [105, 70]
  dust.config.uploader = GalleryPhotoUploader 

  dust.config.full_image_dimensions  = [620, 358]
  dust.config.thumb_image_dimensions = [105, 70]

  # => system location for ImageMagick commands
  dust.config.uploader_command_path = '/usr/local/bin'

end

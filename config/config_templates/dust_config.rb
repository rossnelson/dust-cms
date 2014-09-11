
Dust.configure do |dust|
  # => The menu names that should be included on th esitemap
  dust.config.menus_on_sitemap = ["main", "post"]

  # => The redirect url passed after successful login
  dust.config.after_login_path = "/dust/dashboard/show"

  # => boolean that controls the responsive meta tag in the front_end layout
  dust.config.responsive = false

  # => rendered within the front_end layout
  #     regions are wrappers for groups of blocks
  dust.config.regions = ['header-one', 'header-two', 'content-default', 'footer-one', 'footer-two']

  #     each new page will be created along with a block that renders within the defined default_region
  dust.config.default_region = 'content-default'

  # => inserts the rendered page view content after the defined region
  dust.config.insert_yield_after = 'content-default'

  # => redirects the defined page to the root_url
  dust.config.root = 'welcome'

  # => Array of fields that should show up in the concat form widget
  dust.config.contact_fields = [:name, :email, :message]

  # => :actions => [contact_confirmation, contact_request]
  dust.config.mailer = PostOffice

  # => :resize_to_fit => [620, 358], :thumb => process :resize_to_fill => [105, 70]
  dust.config.uploader = GalleryPhotoUploader 

  dust.config.full_image_dimensions  = [1600, 1600]
  dust.config.thumb_image_dimensions = [200, 200]

  # => system location for ImageMagick commands
  dust.config.uploader_command_path = '/usr/local/bin'
end

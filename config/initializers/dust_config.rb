Dust.configure do |dust|

  dust.config.regions            = ['header-one', 'header-two', 'slider', 'callouts', 'content-default', 'footer-one', 'footer-two']
  dust.config.default_region     = 'content-default'
  dust.config.insert_yield_after = 'callouts'
  dust.config.root               = 'welcome'

end

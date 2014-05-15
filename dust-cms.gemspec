# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

# Maintain your gem's version:
require "dust/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "dust-cms"
  s.version     = Dust::VERSION
  s.authors     = ["Ross"]
  s.email       = ["axcess1@me.com"]
  s.homepage    = "http://www.simiancreative.com"
  s.summary     = "Drop in Rails CMS : `bundle` and run `rake dust:init`"
  s.description = "Drop in Rails CMS : `bundle` and run `rake dust:init`"

  #s.files        = Dir["{app,config,db,lib,vendor}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.files         = `git ls-files`.split($/)
  s.executables   = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.test_files    = Dir["spec/**/*"]
  s.require_paths = ["lib"]

  s.metadata = {
    "docs" => "http://daux.simian.us",
    "source" => "http://git.simian.us/ross/dust"
  }

  s.add_runtime_dependency "commander"
  s.add_runtime_dependency "terminal-table"
  s.add_runtime_dependency "rails", "~> 3.2.16"

  s.add_development_dependency 'mysql2'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'faker'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'factory_girl_rails'

  s.add_dependency "rack-raw-upload"
  
  s.add_dependency "sorcery"
  s.add_dependency 'jquery-rails'
  s.add_dependency 'jquery-ui-rails'
  s.add_dependency 'sass-rails',   '~> 3.2.3'
  s.add_dependency 'coffee-rails', '~> 3.2.1'
  s.add_dependency 'uglifier', '>= 1.0.3'

  s.add_dependency "sorcery"
  s.add_dependency "declarative_authorization"

  s.add_dependency "client_side_validations"
  s.add_dependency "will_paginate"
  s.add_dependency 'simple_form'
  s.add_dependency 'country_select'
  s.add_dependency 'client_side_validations-simple_form'

  s.add_dependency "carrierwave"
  s.add_dependency "mini_magick"
  s.add_dependency 'awesome_nested_set'
  s.add_dependency 'auto_build'

  s.add_dependency 'hashie'
  s.add_dependency 'jbuilder'
  s.add_dependency 'mustache'
  s.add_dependency "haml-rails"
  s.add_dependency "thin"

  s.add_dependency 'numbers_and_words'

  s.add_dependency "better_errors"
  s.add_dependency 'binding_of_caller'
  s.add_dependency 'quiet_assets'

  s.add_dependency 'dust-ckeditor', '3.7.3'
end



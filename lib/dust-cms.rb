require "dust/engine"

require "sorcery"
require "declarative_authorization"
require "client_side_validations"
require "will_paginate"
require "simple_form"
require "country_select"
require "client_side_validations-simple_form"
require "carrierwave"
require "mini_magick"
require "awesome_nested_set"
require "auto_build"
require "dust-ckeditor"
require 'jquery-rails'
require 'jquery-ui-rails'
require "hashie"
require "jbuilder"
require "mustache"
require "haml-rails"
require "numbers_and_words"

unless Rails.env.production?
  require "thin"
  require "better_errors"
end

module Dust
  extend self

  def root
    path = File.expand_path('../..',__FILE__)
    Pathname.new(path)
  end

  def site_wides
    @site_wide ||= Dust::SiteWide.all_to_object
  end

  def configure(&block)
    instance_eval &block
    @config
  end

  def config
    @config ||= OpenStruct.new
  end
end


module Dust
  module Gallery
    class Album < ActiveRecord::Base
      include Dust::Menu::ItemDependency
      filename_prefix "gallery/"

      attr_accessible :description, :position, :title
      acts_as_nested_set

      validates_presence_of :title, :description

      has_many :photos, :dependent => :destroy
    end
  end
end
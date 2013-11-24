module Dust
  class Section < ActiveRecord::Base
    belongs_to :page
    attr_accessible :classes, :position, :title
    acts_as_nested_set
    default_scope roots

    validates_presence_of :title
    validates_uniqueness_of :title

    def slug
      "#{page.nav_link.parameterize}-#{title.parameterize}"
    end
  end
end

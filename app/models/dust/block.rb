module Dust
  class Block < ActiveRecord::Base
    attr_accessible :title, :body, :partial_name, :where_to_show, :show, 
      :show_title, :classes, :weight, :column_span, :column_offset

    default_scope :order => 'weight ASC'

    include ActionView::Helpers::TextHelper
    include ActionView::Helpers::SanitizeHelper

    include Decorator::Block::Widget
    include Decorator::Block::Page
    include Decorator::Block::Grid

    validates_presence_of :title
    #validates_uniqueness_of :title

    def self.page(search, page)
      search(search).paginate(:per_page => 12, :page => page)
    end

    def self.search(search)
      if search
        where("title LIKE ? OR body LIKE ?", "%#{search}%", "%#{search}%")
        .where("show_title = ? OR 'show' != ?", false, '')
      else
        scoped
      end
    end

    def front_end_content
      options = {:block => self}
      Handlebar.render(body, options)
    end

  end
end

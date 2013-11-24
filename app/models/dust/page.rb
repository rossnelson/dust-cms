module Dust
  class Page < ActiveRecord::Base
    attr_accessible :meta_title, :meta_description, :description, :classes
    has_many :sections

    include ActionView::Helpers::TextHelper
    include ActionView::Helpers::SanitizeHelper
    include Dust::Menu::ItemDependency

    validates_presence_of :meta_title
    has_many :blocks, 
      :finder_sql => proc{"SELECT `blocks`.* FROM `blocks` WHERE `blocks`.`show` LIKE \"%/#{filename}%\" ORDER BY weight ASC"}

    def old_blocks
      menu_item.url_changed? ? Block.where("`show` LIKE ?", "%#{menu_item.url_was}%") : []
    end

    def self.page(search, page)
      search(search).order("meta_title").paginate(:per_page => 12, :page => page)
    end

    def self.search(search)
      if search
        where("meta_title LIKE ? OR meta_description LIKE ?", "%#{search}%", "%#{search}%")
      else
        scoped
      end
    end

    def front_end_content
      options = { :page => self }
      Handlebar.render(content, options)
    end

    def create_description
      meta_description
    end

  end
end

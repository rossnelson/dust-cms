module Dust
  class Menu
    module ItemDependency
      extend ActiveSupport::Concern

      # => set an objects filename prefix by calling filename_prefix and
      #    passing in your prefix string
      #
      # filename_prefix "your-prefix/" 
      # # this will save the menu_item url as => "/your-prefix/instance-filename"
      #
      # => the trailing slash is required

      included do
        attr_accessible :filename, :nav_link, :active, :menu
        has_one :menu_item, :as => :linkable, 
          :dependent => :destroy, 
          :autosave => true, 
          :class_name => Dust::MenuItem

        auto_build :menu_item

        validates_presence_of :filename, :nav_link
      end

      def match_path
        menu_item.url
      end

      def filename
        self.menu_item.url.gsub("/#{self.class.prefix}", "")
      end

      def filename=(filename)
        self.menu_item.url = "/#{self.class.prefix}#{filename}"
      end

      def active
        self.menu_item.active
      end

      def active=(active)
        self.menu_item.active = active
      end

      def nav_link
        self.menu_item.title
      end

      def nav_link=(filename)
        self.menu_item.title = filename
      end

      def menu
        self.menu_item.menu_id
      end

      def menu=(menu_id)
        self.menu_item.menu_id = menu_id
      end

      module ClassMethods

        def find_by_filename(filename)
          filename = "/#{self.prefix}#{filename}"
          where(:menu_items => {:url => filename}).joins(:menu_item).first
        end

        def new_with_menu_item(options={})
          item = self.new
          item.build_menu_item
          item.assign_attributes options
          item
        end

        def filename_prefix(prefix)
          @prefix = prefix
        end

        def prefix
          @prefix
        end
      end

    end
  end
end

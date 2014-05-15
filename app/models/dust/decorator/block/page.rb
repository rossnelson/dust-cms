module Dust::Decorator
  module Block
    module Page
      extend ActiveSupport::Concern

      def pages
        pages = []
        Dust::Page.all.each do |page|
          pages << page if url_list.include?(page.menu_item.url)
          pages << page if url_list.blank?
        end
        pages
      end

      def show_me?(uri)
        uri = uri.gsub(/\?.+/, "")
        show = false
        show = true if (url_list.include?(uri) || url_list.blank?)
        show = true if (uri == "/" && url_list.include?("/#{Dust.config.root}"))
        show
      end

      def url_list
        show.split("\r\n")
      end

      module ClassMethods

        def find_active(uri)
          blocks = Dust::Block.all
          blocks.delete_if {|b| !b.show_me?(uri) }
          blocks
        end

      end
    end
  end
end
module Dust
  class Sitemap

    def self.items
      items = self.new
      Dust.config.menus_on_sitemap.collect do |menu_name|
        menus = items.match_(menu_name)
        unless menus.blank?
          menus = menus.collect do |menu| 
            menu.menu_items.select('title, url, updated_at') 
          end
        end
        menus
      end.flatten
    end

    def match_(name)
      titles.where('title LIKE ?', "%#{name}%")
    end

    def titles
      @titles ||= Dust::Menu.select('title, id')
    end

  end
end

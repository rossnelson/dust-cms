module Dust
  class Sitemap

    def self.items
      menus.map { |menu| menu.menu_items }.flatten
    end

    def self.menus
      titles.where('title REGEXP ?', names).includes(:menu_items)
    end

    def self.names
      Dust.config.menus_on_sitemap.join("|")
    end

    def self.titles
      Dust::Menu.select('title, id')
    end

  end
end

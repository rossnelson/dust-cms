module Dust
  module Seed
    extend self

    def steps
      %w(user menus menu_items page site_wides)
    end

    def data
      data = {}
      steps.each{ |step| data[step] = self.send(step) }
      data
    end

    def user
      Dust::Role.create([{:name => "admin"}, {:name => "moderator"}])
      Dust::User.create(:username => 'admin', 
        :password => "secret", 
        :password_confirmation => "secret", 
        :email => 'admin@dust.com', 
        :role => Dust::Role.find_by_name("admin")
      )
      Dust::User.create(:username => 'moderator', 
        :password => "secret", 
        :password_confirmation => "secret", 
        :email => 'moderator@dust.com', 
        :role => Dust::Role.find_by_name("moderator")
      )
    end

    def menus
      [
        Dust::Menu.create({:title => "Main Menu", :nestable => "nest"}),
        Dust::Menu.create({:title => "Admin Menu", :nestable => "no-nest"}),
        Dust::Menu.create({:title => "Posts Menu", :nestable => "no-nest"})
      ]
    end

    def menu_items
      Dust::MenuItem.create([
        {:title => "Pages", :url    => "/dust/pages", :menu_id          => 2, :active => 1},
        {:title => "Blocks", :url   => "/dust/blocks", :menu_id         => 2, :active => 1},
        {:title => "Albums", :url   => "/dust/gallery/albums", :menu_id => 2, :active => 1},
        {:title => "Posts", :url    => "/dust/posts", :menu_id          => 2, :active => 1},
        {:title => "Contacts", :url => "/dust/contacts", :menu_id       => 2, :active => 1},
        {:title => "Roles", :url    => "/dust/roles", :menu_id          => 2, :active => 1},
        {:title => "Users", :url    => "/dust/users", :menu_id          => 2, :active => 1},
        {:title => "Menus", :url    => "/dust/menus", :menu_id          => 2, :active => 1}
      ])
    end

    def page
      @page = Dust::Page.new_with_menu_item(
        :meta_title => "Welcome",
        :nav_link => "Home", 
        :filename => "welcome", 
        :menu => 1,
        :active => 1
      )
      @builder = Dust::Builder::Page.new(:page => @page)
      @builder.save
    end

    def site_wides
      Dust::SiteWide.create([
        {:name => "analytics code", :value         => "UA-xxxxx-1", :category                                   => "site info"},
        {:name => "site url", :value               => "www.newsite.com", :category                              => "site info"},
        {:name => "default description", :value    => "welcome to our new website", :category                   => "site info"},
        {:name => "default recipient", :value      => "admin@dust.com", :category                               => "contact info"},
        {:name => "default recipient name", :value => "ross nelson", :category                                  => "contact info"}
      ])
    end



  end
end

module Dust
  class Engine < ::Rails::Engine
    #isolate_namespace Dust

    initializer 'dust_engine.widget_view_paths', :after=> :disable_dependency_loading do |app|
      ActionController::Base.prepend_view_path File.join(Dust.root, "app/dust/views/widgets")
      ActionController::Base.prepend_view_path "app/views/widgets"

      Rails.application.config.assets.paths << "#{Dust.root}/app/assets/images"
      Rails.application.config.assets.paths << "#{Dust.root}/app/assets/stylesheets"
      Rails.application.config.assets.paths << "#{Dust.root}/app/assets/javascripts"

      Rails.application.config.assets.precompile += %w( front_end.css cms.js cms.css )

    end

  end
end

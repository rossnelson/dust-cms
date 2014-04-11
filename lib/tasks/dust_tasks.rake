namespace :dust do
  desc "Dust cp migrations, migrate, and seed data"
  task :init => :environment do
    Rake::Task["dust_engine:install:migrations"].invoke
    Rake::Task["db:migrate"].invoke
    Rake::Task["dust:seed"].invoke
    Rake::Task["dust:config"].invoke
    Rake::Task["dust:sorcery_config"].invoke
    Rake::Task["dust:override_scaffold"].invoke
    Rake::Task["dust:authorization"].invoke
    Rake::Task["dust:init_css"].invoke
  end

  desc "Generate all Dust app Data"
  task :seed => :environment do
    Rake::Task['db:reset'].invoke
    Dust::Seed.data
  end

  desc "Dust config initializer"
  task :config => :environment do
    template_path = File.join(Dust.root, 'config', 'config_templates', 'dust_config.rb')
    des_path = File.join(Rails.root, 'config', 'initializers')
    cp(template_path, des_path)
  end

  desc "Dust authorization_rules initializer"
  task :authorization => :environment do
    template_path = File.join(Dust.root, 'config', 'config_templates', 'authorization_rules.rb')
    des_path = File.join(Rails.root, 'config')
    cp(template_path, des_path)
  end

  desc "Dust sorcery initializer"
  task :sorcery_config => :environment do
    template_path = File.join(Dust.root, 'config', 'config_templates', 'sorcery.rb')
    des_path = File.join(Rails.root, 'config', 'initializers')
    cp(template_path, des_path)
  end

  desc "Dust init css"
  task :init_css => :environment do
    template_path = File.join(Dust.root, 'app', 'assets', 'stylesheets', 'front_end')
    des_path = File.join(Rails.root, 'app', 'assets', 'stylesheets')
    cp_r(template_path, des_path)

    template_path = File.join(Dust.root, 'app', 'assets', 'stylesheets', 'front_end.css')
    des_path = File.join(Rails.root, 'app', 'assets', 'stylesheets')
    cp(template_path, des_path)
  end
  
  desc "Override Rails scaffold generator"
  task :override_scaffold => :environment do
    template_path = File.join(Dust.root, 'config', 'generators', 'templates')
    des_path = File.join(Rails.root, 'lib', 'templates')
    cp_r(template_path, des_path)
  end
end

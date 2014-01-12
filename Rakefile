require "bundler/gem_tasks"

# run `rake -T` to view available rake tasks
# push this gem to our local gem server with `gem inabox pkg/gem_name-version.gem`

begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

APP_RAKEFILE = File.expand_path("../spec/dummy/Rakefile", __FILE__)
load 'rails/tasks/engine.rake'

Bundler::GemHelper.install_tasks

Dir[File.join(File.dirname(__FILE__), 'tasks/**/*.rake')].each {|f| load f }

require 'rspec/core'
require 'rspec/core/rake_task'

desc "Run all specs in spec directory (excluding plugin specs)"

RSpec::Core::RakeTask.new(:spec => 'app:db:test:prepare')

task :default => :spec

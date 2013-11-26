module Dust::Decorator
  module Block
    module Widget
      extend ActiveSupport::Concern

      module ClassMethods
        def widget_list
          files = []
          paths = widget_filenames
          puts paths
          paths.each do |filename|
            if filename[0] != "." # if file is not hidden
              files.push filename.sub('_', '').gsub('.html.haml', '')
            end
          end
          files
        end

        def widget_files
          paths = []
          Dir["#{Dust.root}/app/views/widgets/**/*"].each {|path| paths << path }
          Dir["#{Rails.root}/app/views/widgets/**/**"].each {|path| paths << path }
          paths
        end

        def widget_filenames
          widget_files.select{ |p| File.file?(p) }.map { |f| widget_option(f) }
        end

        def widget_option(path)
          partial_path = path.gsub("#{Dust.root}/app/views/widgets/", "").gsub("#{Rails.root}/app/views/widgets/", "")
          partial_path
        end
      end      

    end
  end
end


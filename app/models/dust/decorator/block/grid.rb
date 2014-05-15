module Dust::Decorator
  module Block
    module Grid
      extend ActiveSupport::Concern

      def final_classes
        [column_span, column_offset, classes].join(" ")
      end

      module ClassMethods

        def grid
          grid = OpenStruct.new
          grid.columns = (1..12).map{ |i| [i.to_words.titleize, "#{i.to_words} columns"] }
          grid.offsets = (1..12).map{ |i| ["Offset by #{i.to_words.titleize}", "offset-by-#{i.to_words}"]}
          grid
        end

        def regions
          pretty_regions = []
          pretty_regions.concat default_regions
          pretty_regions.concat page_regions
          pretty_regions
        end

        private

        def default_regions
          Dust.config.regions.map do |region|
            [region.humanize.titleize, region]
          end
        end

        def page_regions
          regions = []
          Dust::Page.all.each do |page|
            sections = page.sections.map{ |s| 
              ["#{page.nav_link} | #{s.title}", s.slug] 
            }
            regions.concat sections
          end
          regions
        end

      end

    end
  end
end

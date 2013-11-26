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
          Dust.config.regions.each do |region|
            pretty_regions << [region.humanize.titleize, region]
          end
          Dust::Page.all.each do |page|
            pretty_regions.concat page.sections.map{ |s| ["#{page.nav_link} | #{s.title}", s.slug] } unless page.sections.blank?
          end
          pretty_regions
        end

      end

    end
  end
end

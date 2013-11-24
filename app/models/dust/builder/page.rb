module Dust
  module Builder
    class Page

      def initialize(options={})
        @page       = options[:page]
        @sections   = options[:sections] || []
        @page_attrs = options[:attrs] if options[:attrs]
      end

      def save
          build_sections
          update_blocks
          if @page.errors.blank?
            @page.save
            @block.save
          else
            false
          end
      end

      def update
        build_sections
        update_blocks
        if @page.errors.blank?
          @page.update_attributes(@page_attrs)
        else
          false
        end
      end

      private


      def build_sections
        @sections.each do |section_attr|
          section = ::Dust::Section.find_or_create_by_id_and_page_id(section_attr[0], @page.id)

          if section_attr[1]["_destroy"] == "1"
            section.destroy
          else
            section_attr[1].delete("_destroy")
            section.id = nil if section.new_record?
            section.assign_attributes section_attr[1]

            determine_validity_of(section)
            @page.sections << section
          end
        end
      end

      def update_blocks
        if @page.menu_item.url_changed? 
          previous = @page.menu_item.url_was
          current = @page.menu_item.url

          @page.old_blocks.each do |block|
            show = block.show.gsub(previous, current)
            unless block.update_attributes(:show => show)
              validate_block(block)
            end
          end
        end

        create_starter_block if @page.new_record?
      end

      def validate_block(block)
        @page.errors[:base] << "Block #{block.title} is not valid"
        block.errors.full_messages.each do |error|
          @page.errors[:base] << "Block | #{error}"
        end
      end

      def determine_validity_of(section)
        unless section.valid?
          @page.errors[:base] << "Section #{section.title} is not valid"
          section.errors.full_messages.each do |error|
            @page.errors[:base] << "Section | #{error}"
          end
        end
      end

      def create_starter_block
        @block = Block.new(
          :show_title => true,
          :title => "#{@page.meta_title} Page Content", 
          :body => "<h1> #{@page.meta_title} </h1> <p>New content.</p>", 
          :classes => "twelve columns", 
          :where_to_show => Dust.config.default_region,
          :show => "/#{@page.filename}",
          :weight => 0
        )
      end

    end
  end
end


module Dust
  class Post < ActiveRecord::Base
    include Dust::Menu::ItemDependency
    filename_prefix "posts"

    mount_uploader :file, ImageUploader
    attr_accessible :body, :file, :published, :published_date, :share, :share_type, :title
    validates_presence_of :title, :body, :published_date

    scope :recent, where(:published => true).order('published_at DESC')
    scope :for_month_and_year, lambda { |year, month|
      date = Date.parse("#{year}-#{month}-01")
      where("published_at between ? and ?", date, date.next_month.beginning_of_month)
    }

    before_validation :set_menu_item

    def set_menu_item
      self.filename = self.slug
      self.nav_link = self.title
      self.menu     = 3
    end

    def published_date
      self.published_at ? self.published_at.strftime("%Y/%m/%d") : Time.now.strftime("%Y/%m/%d")
    end

    def published_date=(date_str)
      self.published_at = Time.parse date_str
    end

    def slug
      "#{published_date}/#{url_title}"
    end

    def url_title
      title.blank? ? "empty-title" : title.parameterize
    end

    def description
      @desc ||= self.body.dup
      @desc.gsub!(/<\/?[^>]*>/, "")
      @desc.gsub!("&nbsp;", " ")
      CGI.unescapeHTML(@desc)
    end

    def siblings
      recent = self.class.recent
      siblings = OpenStruct.new
      recent.each_with_index do |post, index|
        if post.id == self.id
          siblings.older = recent[(index+1)%recent.size] unless index+1 == recent.count
          siblings.newer = recent[(index-1)] unless index == 0
        end
      end
      siblings
    end

  end
end


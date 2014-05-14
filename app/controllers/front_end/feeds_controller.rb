class FrontEnd::FeedsController < FrontEndController

  respond_to :rss
  layout false

  def posts
    @posts = Dust::Post.where(:published => true).all(:select => "title, id, body, published_at", :order => "published_at DESC", :limit => 20)
  end

end


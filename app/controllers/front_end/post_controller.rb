class FrontEnd::PostsController < FrontEndController
    
  def index
    @posts = Dust::Post.order(:published_date => 'DESC').where(:published => true)
  end
  
  def show
    @post = Dust::Post.find_by_filename("post/#{params[:filename]}")

    if @post == nil
      raise Exceptions::PageNotFound
    end

    rescue Exceptions::PageNotFound
      render :file => "#{Rails.root}/public/404.html", :layout => false, :status => 404
  end

end

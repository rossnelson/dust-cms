class FrontEnd::PageController < FrontEndController

  before_filter :root_redirect

  def show
    @page = Dust::Page.find_by_filename(params[:filename])
    @contact = Dust::Contact.new

    if @page == nil
      raise Exceptions::PageNotFound
    end

    rescue Exceptions::PageNotFound
      render :file => "#{Rails.root}/public/404.html", :layout => false, :status => 404
  end

  def search
    @results = (params[:query].present? ? Dust::Block.search(params[:query]) : [])
  end

  def root_redirect
    if "/#{Dust.config.root}" == request.fullpath
      redirect_to root_url, :status => 301
    end
  end

end

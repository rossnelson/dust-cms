class FrontEnd::SitemapController < FrontEndController

  def index
    @latest = Dust::MenuItem.last
    respond_to do |format|
      format.xml  { @menu_items = Dust::Page.sitemap}
      format.html { @menu_items = Dust::Page.sitemap}
    end
  end

end

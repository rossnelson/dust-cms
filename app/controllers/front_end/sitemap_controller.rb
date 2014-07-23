class FrontEnd::SitemapController < FrontEndController

  def index
    @latest = Dust::MenuItem.last
    respond_to do |format|
      format.xml  { @menu_items = Dust::Sitemap.items}
      format.html { @menu_items = Dust::Sitemap.items}
    end
  end

end

class FrontEnd::GalleryController < FrontEndController

  def show
    @album = Dust::Gallery::Album.includes(:photos).find_by_filename(params[:filename])
  end

end

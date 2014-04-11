module Dust
  class SortableController < AuthenticationController

    #respond_to :json, :js

    def sort
      begin
        @menu_sort = Dust::Sort.new(params[:list], params[:class_name])
      rescue ActiveRecord::RecordNotFound => e
        render :json => {type: 'error', message: "Sorting Failed | #{e}"}
      else
        render :json => {type: 'notice', message: "Sort Successfull!"}
      end

    end

  end
end

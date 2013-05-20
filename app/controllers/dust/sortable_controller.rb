module Dust
  class SortableController < AuthenticationController

    def sort
      begin
        @menu_sort = Dust::Sort.new(params[:list], params[:class_name])
      rescue ActiveRecord::RecordNotFound => e
        not_found = true
        flash[:error] = "Sorting Failed | #{e}"
      else
        flash[:notice] = "Sort Successfull!"
      end

    end

  end
end

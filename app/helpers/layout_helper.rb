module LayoutHelper
  def title(page_title, show_title = true)
    content_for(:title) { h(page_title.to_s) }
    @show_title = show_title
  end

  def show_title?
    @show_title
  end

  def heading(page_title, show_title = true)
    content_for(:heading) { h(page_title.to_s) }
  end

  def description(page_description, show_description = true)
    content_for(:description) { h(page_description.to_s) }
  end

  def stylesheet(*args)
    content_for(:head) { stylesheet_link_tag(*args) }
  end

  def javascript(*args)
    content_for(:head) { javascript_include_tag(*args) }
  end

  def page_class
    @page_class = ""
    @page_class += (request.fullpath == "/" ? "home " : "interior ")
    @page_class += (yield(:title) || @site_data.site_info.site_url).to_s.parameterize
  end
end

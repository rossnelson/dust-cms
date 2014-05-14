module DustPostHelper

  def post_head(post)
    content_tag :div, :class => "post-head-wrap" do
      content_tag(:p, image_tag(post.file.url))
    end
  end

end


xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title Dust.site_wides.site_url
    xml.description Dust.site_wides.default_description
    xml.link front_end_posts_url

    @posts.each do |post|
      xml.item do
        xml.title post.title
        xml.description raw post.body
        xml.pubDate post.published_at.to_s(:rfc822)
        xml.link front_end_post_url(post.slug)
        xml.guid front_end_post_url(post.slug)
      end
    end
  end
end


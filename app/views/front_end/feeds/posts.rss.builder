xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Ayurveda Massage Therapies Posts"
    xml.description "A massage practice that brings Lakeland, Florida and surrounding counties, personalized affordable massage therapy"
    xml.link "http://ayurvedamt.com/archive"

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


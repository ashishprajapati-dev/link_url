# The main LinkUrl driver
class LinkUrl
  # Convert any image url into the image tag sepratedly and remain other url normal by using convert_image("www.clecotech.in http://www.ashishprajapati.com/new.png").
  # Convert image url into image tag and normal url into link by using convert_all("www.ashishprajapati.com/new.png").
  # Convert any url from the string or text into the links by using convert("www.ashishprajapati.com").
  # 
  # Example:
  #   >> LinkUrl.convert("Hi my new website http://www.bookofskills.com ! Please come at us to reward me.")
  #   => Hi my new website <a href='http://www.bookofskills.com'>http://www.bookofskills.com</a> ! Please come at us to reward me.
  #   >> LinkUrl.convert_image("Hi I have updated the code. my website is www.ashishprajapati.com you can see my pic using www.ashishprajapati.com/ashish.png")       
  #   => Hi I have updated the code. my website is www.ashishprajapati.com you can see my pic using <img src='www.ashishprajapati.com/ashish.png' />
  #   >> LinkUrl.convert_all("Hi I have updated the code. my website is www.ashishprajapati.com you can see my pic using www.ashishprajapati.com/ashish.png")       
  #   => Hi I have updated the code. my website is <a href='www.ashishprajapati.com'>www.ashishprajapati.com</a> you can see my pic using <img src='www.ashishprajapati.com/ashish.png' />
  # Arguments:
  #   content: (String)
  # Convert all url into links.
  def self.convert(content)
    if(content) 
    exp =/\b((?:mailto:\S+|(?:https?|ftp|file):\/\/|www.)[^\s<]+)\b/
    content = content.gsub(exp) { |url| "<a href='"+url+"'>"+url+"</a>" }
    content = content.gsub("<a href='www.","<a href='http://www.");
    return content
    end
  end
  # Convert Image Url into image tag and other url remain normal.
  def self.convert_image(content)
    if(content) 
      exp =/\b(((?:https?|ftp|file):\/\/|www.)[^\s<]+)\b/
        content = content.gsub(exp) do |url|
        if url[/(?:png|jpe?g|gif|svg|bmp)$/]
          "<img src='#{url}' />"
        else
          "#{url}"
        end
      end
    end
  end
  # Convert Image Url into image tag and normal url into link.
  def self.convert_all(content)
    if(content) 
      exp =/\b(((?:https?|ftp|file):\/\/|www.)[^\s<]+)\b/
        content = content.gsub(exp) do |url|
        if url[/(?:png|jpe?g|gif|svg|bmp)$/]
          "<img src='#{url}' />"
        else
          "<a href='#{url}'>#{url}</a>"
        end
      end
    end
  end
end

# The main LinkUrl driver
class LinkUrl
  # Convert any url from the string or text into the links
  #
  # Example:
  #   >> LinkUrl.convert("Hi my new website http://www.bookofskills.com ! Please come at us to reward me.")
  #   => Hi my new website <a href='http://www.bookofskills.com'>http://www.bookofskills.com</a> ! Please come at us to reward me.
  #
  # Arguments:
  #   content: (String)

  def self.convert(content)
  	if !content.gsub( %r{https://[^\s<]+} ).nil?
    	content.gsub( %r{http://[^\s<]+} ) do |url|
    		content = content.gsub(url,"<a href='"+url+"'>"+url+"</a>")
  		end
  	end
  	if !content.gsub( %r{https://[^\s<]+} ).nil?
  		content.gsub( %r{https://[^\s<]+} ) do |url|
    		content = content.gsub(url,"<a href='"+url+"'>"+url+"</a>")
  		end
  	end
  	if !content.gsub( %r{ www.[^\s<]+} ).nil?
  		content.gsub( %r{ www.[^\s<]+} ) do |url|
    		content = content.gsub(url," <a href='http://"+url.gsub(" ","")+"'>"+url.gsub(" ","")+"</a>")
  		end
  	end
    if !content.gsub( %r{^\www.[^\s<]+} ).nil?
      content.gsub( %r{^\www.[^\s<]+} ) do |url|
        content = content.gsub(url,"<a href='http://"+url+"'>"+url+"</a>")
      end
    end
  	return content
  end
end

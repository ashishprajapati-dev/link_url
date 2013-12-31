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
    if(content) 
    exp =/\b((?:mailto:\S+|(?:https?|ftp|file):\/\/|www.)[^\s<]+)\b/
    content = content.gsub(exp) { |url| "<a href='"+url+"'>"+url+"</a>" }
    content = content.gsub("<a href='www.","<a href='http://www.");
    return content
    end
  end
end

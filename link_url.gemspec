Gem::Specification.new do |s|
  s.name        = 'link_url'
  s.version     = '0.0.9'
  s.date        = '2016-03-14'
  s.summary     = "Convert all images into image tag and url into link or as per your choice"
  s.description = 'Convert any image url into the image tag sepratedly and remain other url normal by using LinkUrl.convert_image("www.clecotech.in http://www.ashishprajapati.com/new.png"). Convert image url into image tag and normal url into link by using LinkUrl.convert_all("www.ashishprajapati.com/new.png"). Convert any url from the string or text into the links by using LinkUrl.convert("www.ashishprajapati.com").'
  s.authors     = ["Ashish Prajapati"]
  s.email       = 'mail@ashishprajapati.com'
  s.files       = ["lib/link_url.rb"]
  s.homepage    = 'http://rubygems.org/gems/link_url'
end

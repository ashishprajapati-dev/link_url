require 'test/unit'
require 'link_url'

class LinkUrlTest < Test::Unit::TestCase
  def test_http
      assert_equal "Hi my new website <a href='http://www.bookofskills.com'>http://www.bookofskills.com</a> ! Please come at us to reward me.",
      LinkUrl.convert("Hi my new website http://www.bookofskills.com ! Please come at us to reward me.")
  end

  def test_https
      assert_equal "It is good to search on <a href='https://www.google.com'>https://www.google.com</a>",
      LinkUrl.convert("It is good to search on https://www.google.com")
  end

  def test_wwww
      assert_equal "<a href='http://www.ashishprajapati.com'>www.ashishprajapati.com</a> is my personal website.",
      LinkUrl.convert("www.ashishprajapati.com is my personal website.")
  end
  def test_all
      assert_equal "I have created many websites and some of them are <a href='http://www.clecotech.in'>www.clecotech.in</a> <a href='http://www.aptrick.in'>http://www.aptrick.in</a> , <a href='http://www.bookofskills.com'>www.bookofskills.com</a> , <a href='https://rubygems.org'>https://rubygems.org</a> and <a href='http://www.codead.com'>http://www.codead.com</a>",
      LinkUrl.convert("I have created many websites and some of them are www.clecotech.in http://www.aptrick.in , www.bookofskills.com , https://rubygems.org and http://www.codead.com")
  end
end
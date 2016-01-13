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
    exp =/\b(((?:mailto:\S+|(?:https?|ftp|file):\/\/|www.)[^\s<]+)|[^\s<]+(#{self.tlds.values.join('|\\')}))\b/
      content = content.gsub(exp) do |url|
        if (url=~/http:\/\/|https:\/\/|ftp:\/\/|file:\/\/|www\./)!=0 && url[/(#{self.tlds.values.join('|\\')})$/]
          "<a href='http://#{url}'>#{url}</a>"
        else
          "<a href='#{url}'>#{url}</a>".gsub("<a href='www.","<a href='http://www.");
        end
      end
    return content
    end
  end
  # Convert Image Url into image tag and other url remain normal.
  def self.convert_image(content)
    if(content) 
      exp =/\b(((?:mailto:\S+|(?:https?|ftp|file):\/\/|www.)[^\s<]+)|[^\s<]+(#{self.tlds.values.join('|\\')}))\b/
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
      exp =/\b(((?:mailto:\S+|(?:https?|ftp|file):\/\/|www.)[^\s<]+)|[^\s<]+(#{self.tlds.values.join('|\\')}))\b/
      content = content.gsub(exp) do |url|
        if url[/(?:png|jpe?g|gif|svg|bmp)$/]
          "<img src='#{url}' />"
        elsif (url=~/http:\/\/|https:\/\/|ftp:\/\/|file:\/\/|www\./)!=0 && url[/(#{self.tlds.values.join('|\\')})$/]
          "<a href='http://#{url}'>#{url}</a>"
        else
          "<a href='#{url}'>#{url}</a>".gsub("<a href='www.","<a href='http://www.");
        end
      end
    end
  end

  def self.tlds
    {'ad' => '.ad', 'ae' => '.ae', 'af' => '.af', 'ag' => '.ag', 'ai' => '.ai', 'al' => '.al', 'am' => '.am', 'ao' => '.ao', 'aq' => '.aq', 'ar' => '.ar', 'as' => '.as', 'at' => '.at', 'au' => '.au', 'aw' => '.aw', 'ax' => '.ax', 'az' => '.az', 'ba' => '.ba', 'bb' => '.bb', 'bd' => '.bd', 'be' => '.be', 'bf' => '.bf', 'bg' => '.bg', 'bh' => '.bh', 'bi' => '.bi', 'bj' => '.bj', 'bl' => '.bl', 'bm' => '.bm', 'bn' => '.bn', 'bo' => '.bo', 'bq' => '.bq', 'br' => '.br', 'bs' => '.bs', 'bt' => '.bt', 'bv' => '.bv', 'bw' => '.bw', 'by' => '.by', 'bz' => '.bz', 'ca' => '.ca', 'cc' => '.cc', 'cd' => '.cd', 'cf' => '.cf', 'cg' => '.cg', 'ch' => '.ch', 'ci' => '.ci', 'ck' => '.ck', 'cl' => '.cl', 'cm' => '.cm', 'cn' => '.cn', 'co' => '.co', 'cr' => '.cr', 'cu' => '.cu', 'cv' => '.cv', 'cw' => '.cw', 'cx' => '.cx', 'cy' => '.cy', 'cz' => '.cz', 'de' => '.de', 'dj' => '.dj', 'dk' => '.dk', 'dm' => '.dm', 'do' => '.do', 'dz' => '.dz', 'ec' => '.ec', 'ee' => '.ee', 'eg' => '.eg', 'eh' => '.eh', 'er' => '.er', 'es' => '.es', 'et' => '.et', 'fi' => '.fi', 'fj' => '.fj', 'fk' => '.fk', 'fm' => '.fm', 'fo' => '.fo', 'fr' => '.fr', 'ga' => '.ga', 'gb' => '.gb (.uk)', 'gd' => '.gd', 'ge' => '.ge', 'gf' => '.gf', 'gg' => '.gg', 'gh' => '.gh', 'gi' => '.gi', 'gl' => '.gl', 'gm' => '.gm', 'gn' => '.gn', 'gp' => '.gp', 'gq' => '.gq', 'gr' => '.gr', 'gs' => '.gs', 'gt' => '.gt', 'gu' => '.gu', 'gw' => '.gw', 'gy' => '.gy', 'hk' => '.hk', 'hm' => '.hm', 'hn' => '.hn', 'hr' => '.hr', 'ht' => '.ht', 'hu' => '.hu', 'id' => '.id', 'ie' => '.ie', 'il' => '.il', 'im' => '.im', 'in' => '.in', 'io' => '.io', 'iq' => '.iq', 'ir' => '.ir', 'is' => '.is', 'it' => '.it', 'je' => '.je', 'jm' => '.jm', 'jo' => '.jo', 'jp' => '.jp', 'ke' => '.ke', 'kg' => '.kg', 'kh' => '.kh', 'ki' => '.ki', 'km' => '.km', 'kn' => '.kn', 'kp' => '.kp', 'kr' => '.kr', 'kw' => '.kw', 'ky' => '.ky', 'kz' => '.kz', 'la' => '.la', 'lb' => '.lb', 'lc' => '.lc', 'li' => '.li', 'lk' => '.lk', 'lr' => '.lr', 'ls' => '.ls', 'lt' => '.lt', 'lu' => '.lu', 'lv' => '.lv', 'ly' => '.ly', 'ma' => '.ma', 'mc' => '.mc', 'md' => '.md', 'me' => '.me', 'mf' => '.mf', 'mg' => '.mg', 'mh' => '.mh', 'mk' => '.mk', 'ml' => '.ml', 'mm' => '.mm', 'mn' => '.mn', 'mo' => '.mo', 'mp' => '.mp', 'mq' => '.mq', 'mr' => '.mr', 'ms' => '.ms', 'mt' => '.mt', 'mu' => '.mu', 'mv' => '.mv', 'mw' => '.mw', 'mx' => '.mx', 'my' => '.my', 'mz' => '.mz', 'na' => '.na', 'nc' => '.nc', 'ne' => '.ne', 'nf' => '.nf', 'ng' => '.ng', 'ni' => '.ni', 'nl' => '.nl', 'no' => '.no', 'np' => '.np', 'nr' => '.nr', 'nu' => '.nu', 'nz' => '.nz', 'om' => '.om', 'pa' => '.pa', 'pe' => '.pe', 'pf' => '.pf', 'pg' => '.pg', 'ph' => '.ph', 'pk' => '.pk', 'pl' => '.pl', 'pm' => '.pm', 'pn' => '.pn', 'pr' => '.pr', 'ps' => '.ps', 'pt' => '.pt', 'pw' => '.pw', 'py' => '.py', 'qa' => '.qa', 're' => '.re', 'ro' => '.ro', 'rs' => '.rs', 'ru' => '.ru', 'rw' => '.rw', 'sa' => '.sa', 'sb' => '.sb', 'sc' => '.sc', 'sd' => '.sd', 'se' => '.se', 'sg' => '.sg', 'sh' => '.sh', 'si' => '.si', 'sj' => '.sj', 'sk' => '.sk', 'sl' => '.sl', 'sm' => '.sm', 'sn' => '.sn', 'so' => '.so', 'sr' => '.sr', 'ss' => '.ss', 'st' => '.st', 'sv' => '.sv', 'sx' => '.sx', 'sy' => '.sy', 'sz' => '.sz', 'tc' => '.tc', 'td' => '.td', 'tf' => '.tf', 'tg' => '.tg', 'th' => '.th', 'tj' => '.tj', 'tk' => '.tk', 'tl' => '.tl', 'tm' => '.tm', 'tn' => '.tn', 'to' => '.to', 'tr' => '.tr', 'tt' => '.tt', 'tv' => '.tv', 'tw' => '.tw', 'tz' => '.tz', 'ua' => '.ua', 'ug' => '.ug', 'um' => '.um', 'us' => '.us', 'uy' => '.uy', 'uz' => '.uz', 'va' => '.va', 'vc' => '.vc', 've' => '.ve', 'vg' => '.vg', 'vi' => '.vi', 'vn' => '.vn', 'vu' => '.vu', 'wf' => '.wf', 'ws' => '.ws', 'ye' => '.ye', 'yt' => '.yt', 'za' => '.za', 'zm' => '.zm', 'zw' => '.zw','com'=>'.com','org'=>'.org','net'=>'.net','int'=>'.int','edu'=>'.edu','gov'=>'.gov','mil'=>'.mil'}
  end
end
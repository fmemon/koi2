module LinksHelper

  def get_host_without_www(url)
    URI.parse(url).host #=> "techcrunch.com" 
  end
  
    def get_username_from_email_address(email)
    email =~ (/(.+)[@]/)
    $1
  end


end

require 'spec_helper'

describe Link do
  
  before(:each) do
    @attr = Factory.attributes_for(:link)
  end

  
  it "should create a new instance given a valid attribute" do
    Link.create!(@attr)
  end
  
  describe "title validation" do 
		it "should not be blank" do
			no_title_link = Link.new(@attr.merge(:title => ""))
			no_title_link.should_not be_valid
		end
		
		it "should reject duplicate titles" do
			Link.create!(@attr)
			link_with_duplicate_title = Link.new(@attr)
			link_with_duplicate_title.should_not be_valid
		end
		
		it "should reject titles identical up to case" do
			upcased_title = @attr[:title].upcase
			Link.create!(@attr.merge(:title => upcased_title))
			link_with_duplicate_title = Link.new(@attr)
			link_with_duplicate_title.should_not be_valid
		end
		
			it "should reject a short title" do
				short_title = "a" *4
				invalid_title_link = Link.new(@attr.merge(:title => short_title))
				invalid_title_link.should_not be_valid
			end
			it "should reject a long title" do
				long_title = "a" *101
				invalid_title_link = Link.new(@attr.merge(:title => long_title))
				invalid_title_link.should_not be_valid
			end
  end

  describe "url validation" do 
		it "should not be blank" do
			no_url_link = Link.new(@attr.merge(:url => ""))
			no_url_link.should_not be_valid
		end

  it "should accept valid url" do
    urls = ["http://www.google.com", "http://www.google.de", "https://www.bankofamerica.com"]

    urls.each do |url|
      valid_url_link = Link.new(@attr.merge(:url => url))
     valid_url_link.should be_valid
    end
  end
  
  it "should reject invalid url" do
    #urls = ["http:/wwws.godfdf.dde", "ftp://wwws.dfsdd.de", "http://wwws.dfsdd.cxm","http:/wwws.dfsdd.de", "http://wwws.dfsdd@de"]
    urls = ["http:/wwws.godfdf.dde", "ftp://wwws.dfsdd.de","http:/wwws.dfsdd.de", "http://wwws.dfsdd@de"]

    urls.each do |url|
    invalid_url_link = Link.new(@attr.merge(:url => url))
    invalid_url_link.should_not be_valid
    end
  end

		it "should reject duplicate urls" do
			Link.create!(@attr)
			link_with_duplicate_url = Link.new(@attr)
			link_with_duplicate_url.should_not be_valid
		end
		
		it "should reject urls identical up to case" do
			upcased_url = @attr[:url].upcase
			Link.create!(@attr.merge(:url => upcased_url))
			link_with_duplicate_url = Link.new(@attr)
			link_with_duplicate_url.should_not be_valid
		end
		
			it "should reject a short url" do
				short_url = "a" *4
				invalid_url_link = Link.new(@attr.merge(:url => short_url))
				invalid_url_link.should_not be_valid
			end
			it "should reject a long url" do
				long_url = "a" *101
				invalid_url_link = Link.new(@attr.merge(:url => long_url))
				invalid_url_link.should_not be_valid
			end
  end
  
	it "should reject no user" do
		no_user_link = Link.new(@attr.merge(:user => nil))
		no_user_link.should_not be_valid
	end
  
	it "should reject no category" do
		no_category_link = Link.new(@attr.merge(:category => nil))
		no_category_link.should_not be_valid
	end
	
end# == Schema Information
#
# Table title: users
#
#  id                     :integer         not null, primary key
#  email                  :string(255)     default(""), not null
#  encrypted_password     :string(255)     default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer         default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  title                   :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#


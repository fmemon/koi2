require 'spec_helper'

describe Category do
  
  before(:each) do
    @attr = { 
      :name => "WorldNews",
    }
  end
  
  describe "name validation" do 
it "should not be blank" do
    no_name_category = Category.new(@attr.merge(:name => ""))
    no_name_category.should_not be_valid
  end
  
  it "should accept valid names" do
  #  names = %w[Worldnews sporks Chinese "world_news"]
    names = ["Worldednews", "sporks_Chinese"]

    names.each do |name|
      valid_name_category = Category.new(@attr.merge(:name => name))
     valid_name_category.should be_valid
    end
  end
  
  it "should reject invalid names" do
    names = ["world.news", "world%news", "world&news",  "world news"]

    names.each do |name|
    invalid_name_category = Category.new(@attr.merge(:name => name))
    invalid_name_category.should_not be_valid
    end
  end
  
  it "should reject duplicate names" do
    Category.create!(@attr)
    category_with_duplicate_name = Category.new(@attr)
    category_with_duplicate_name.should_not be_valid
  end
  
  it "should reject names identical up to case" do
    upcased_name = @attr[:name].upcase
    Category.create!(@attr.merge(:name => upcased_name))
    category_with_duplicate_name = Category.new(@attr)
    category_with_duplicate_name.should_not be_valid
  end
  
  	it "should reject a short name" do
  		short_name = "a"
      invalid_name_category = Category.new(@attr.merge(:name => short_name))
      invalid_name_category.should_not be_valid
  	end
  	it "should reject a long name" do
  		long_name = "a" *41
      invalid_name_category = Category.new(@attr.merge(:name => long_name))
      invalid_name_category.should_not be_valid
  	end
  end
  
  
  
  it "should create a new instance given a valid attribute" do
    Category.create!(@attr)
  end
  
  
  


end# == Schema Information
#
# Table name: users
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
#  name                   :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#


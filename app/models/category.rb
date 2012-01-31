class Category < ActiveRecord::Base
  has_many :links
  
  validates :name,   :presence => true, 
																:uniqueness => {:case_sensitive => false},
																:length => {:within => 2..40},
																:format => { :with =>  /^[a-zA-Z0-9_]*[a-zA-Z][a-zA-Z0-9_]*$/ , 
                                                      :message =>"must have at least one letter and contain only letters, digits, or underscores"} 


end
# == Schema Information
#
# Table name: categories
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#


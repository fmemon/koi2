require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the UsersHelper. For example:
#
# describe UsersHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       helper.concat_strings("this","that").should == "this that"
#     end
#   end
# end
describe UsersHelper do
  describe "get username from email address" do
    it "get username from email address" do
      #helper.concat_strings("this","that").should == "this that"
      helper. fu_robots("farida@yahoo.com").should == "farida"
    end
  end
end

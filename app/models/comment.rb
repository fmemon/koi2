class Comment < ActiveRecord::Base
  belongs_to :link
  belongs_to :user
end
# == Schema Information
#
# Table name: comments
#
#  id         :integer         not null, primary key
#  commenter  :string(255)
#  body       :text
#  link_id    :integer
#  created_at :datetime
#  updated_at :datetime
#


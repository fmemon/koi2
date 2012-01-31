class Vote < ActiveRecord::Base
  attr_accessible :score, :link_id, :user_id 

  belongs_to :link
  belongs_to :user

  validates_uniqueness_of :link_id, :scope => :user_id, :message => "can only be voted once per user"
  
  def setscore(val)
   self.score = val
  end
  
  def is_score_up?
      self.score == 1
  end

  def is_score_down?
      self.score == -1
  end

end

# == Schema Information
#
# Table name: votes
#
#  id         :integer         not null, primary key
#  link_id    :integer
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#  score      :integer         default(0)
#


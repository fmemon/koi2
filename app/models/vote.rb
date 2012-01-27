class Vote < ActiveRecord::Base
  attr_accessible :score

  belongs_to :link
  belongs_to :user

  validates_uniqueness_of :link_id, :scope => :user_id, :message => "can only be voted once per user"
  
  def setscore(val)
   self.score = val
  end
  
  def is_score_up?
      if self.score == 1
        puts "&&&&&&&&&&ITS UpALREADY"
        p self.score
        puts "&&&&&&&&&&ITS DOWN ALREADY"
        return true 
      else
        return false
      end
  end

  def is_score_down?
      if self.score == -1
        puts "&&&&&&&&&&ITS DOWN ALREADY"
        p self.score
        puts "&&&&&&&&&&ITS DOWN ALREADY"
        return true 
      else
        return false
      end
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


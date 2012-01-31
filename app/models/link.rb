class Link < ActiveRecord::Base
  
  before_save(:on => :create) do
   self.short_url = Googl.shorten(self.url).short_url #from Googl gem
  end

  validates :url, :presence => true
  validates :title, :presence => true,
                    :length => { :minimum => 5, :maximum => 100 }

  belongs_to :user # foreign key - user_id
  belongs_to :category # foreign key - category_id
  has_many :votes
  has_many :comments
  
  scope :latest, order('created_at DESC').limit(10)
  scope :voted_links, includes(:votes).group('links.id, votes.id').order('SUM(COALESCE(votes.score, 0)) DESC')

  def to_param
    "#{id}-#{title.parameterize}"
  end

  def self.promoted_link
      self.where(:promoted => true).order("RANDOM()").first || self.last_link_promoted
  end
  
  def self.last_link_promoted
			last_link = Link.last
			last_link.promoted = true
      last_link.save
      last_link
  end

	def self.by_searchterm(q)
		query = "%#{q}%".downcase
		Link.voted_links.where('LOWER(title) LIKE ? OR LOWER(url) LIKE ?', query, query)
	end

end

# == Schema Information
#
# Table name: links
#
#  id          :integer         not null, primary key
#  url         :string(255)
#  title       :string(255)
#  user_id     :integer
#  short_url   :string(255)
#  thumbnail   :string(255)
#  promoted    :boolean
#  created_at  :datetime
#  updated_at  :datetime
#  category_id :integer
#


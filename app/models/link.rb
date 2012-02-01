class Link < ActiveRecord::Base
  
  before_save(:on => :create) do
   self.short_url = Googl.shorten(self.url).short_url #from Googl gem
  end

email_regex = /(^$)|(^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$)/ix
# email_regex = /\b((?#optional port)(https?|ftp|file)://)? (?#sub domain)([a-z0-9](?:[-a-z0-9]*[a-z0-9])?\.)
# + (?#top domain)(com\b|edu\b|biz\b|gov\b|in(?:t|fo)\b|mil\b|net\b|org\b|[a-z][a-z]\b) (?#optional port)(:\d+
# )? (?#optional path)(/[-a-z0-9_:\@&amp;?=+,.!/~*'%\$]*)* (?#not ending in)(?&lt;![.,?!]) (?#not enclosed in)(?!((?!(?:&lt;a )).)
# *?(?:&lt;/a&gt;)) (?#or enclosed in)(?!((?!(?:&lt;!--)).)*?(?:--&gt;))/ix



  validates :url,     :presence => true,
  														:uniqueness => {:case_sensitive => false},
															:length => {:within => 5..50},
															:format => {:with => email_regex, :message =>"must have at least one letter and contain only letters, digits, or underscores"}
  validates :title,   :presence => true,
															:uniqueness => {:case_sensitive => false},
															:length => {:within => 5..100} 
validates_presence_of :category_id, :user_id


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


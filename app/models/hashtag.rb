class Hashtag < ActiveRecord::Base
  attr_accessible :hashtag, :campaign_id
  validates :hashtag, :presence => true
end

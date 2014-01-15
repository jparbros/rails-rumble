class Hashtag < ActiveRecord::Base
  attr_accessible :hashtag, :campaign_id, :mood
  validates :hashtag, :presence => true
end

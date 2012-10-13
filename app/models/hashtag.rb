class Hashtag < ActiveRecord::Base
  attr_accessible :hashtag
  validates :hashtag, :presence => true
end

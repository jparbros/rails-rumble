class Campaign < ActiveRecord::Base
  attr_accessible :description, :name
  validates :description, :name, :presence => true
  has_many :hashtags
  has_many :incidents
end
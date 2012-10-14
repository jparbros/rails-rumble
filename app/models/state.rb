class State < ActiveRecord::Base
  #
  # Accessor
  #
  attr_accessible :name, :position
  
  #
  # Validates
  #
  validates :name, presence: true
  
end

class Incident < ActiveRecord::Base
  
  #
  # Accessors
  #
  attr_accessible :description, :incident_type_id, :state_id, :title, :campaign_id
  
  #
  # Associations
  #
  belongs_to :state
  belongs_to :campaign
  has_many :comments, as: :commentable
end

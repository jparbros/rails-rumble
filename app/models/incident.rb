class Incident < ActiveRecord::Base
  
  #
  # Accessors
  #
  attr_accessible :description, :incident_type_id, :state_id, :title
  
  #
  # Associations
  #
  belongs_to :state
  
end

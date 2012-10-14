class IncidentType < ActiveRecord::Base
  attr_accessible :name, :organization_id
  validates :name, :presence => true
end

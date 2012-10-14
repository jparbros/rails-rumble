class ExternalUrl < ActiveRecord::Base
  #
  # Accessor
  #
  attr_accessible :social_message_id, :url
  
  #
  # Associations
  #
  belongs_to :social_message
  
  def self.create_from_result(result)
    result.urls.each do |url|
      external_url = self.new
      external_url.url = url.display_url
      external_url.save!
    end
  end
  
  
end

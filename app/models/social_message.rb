class SocialMessage < ActiveRecord::Base
  #
  # Accessor
  #
  attr_accessible :content, :provider, :social_id, :incident_id, :historical_search_id, :media_url, :external_url
  
  #
  # Associations
  #
  belongs_to :incident
  belongs_to :historical_search
  has_many :images
  has_many :external_urls
  
  def self.create_from_result(result, provider)
    unless self.exists?(social_id: result[:id].to_s, provider: provider)
      @social_message = self.create!(social_id: result[:id].to_s, provider: provider, content: result[:text])
      @social_message.images.create_from_result(result)
      @social_message.external_urls.create_from_result(result)
      return @social_message
    end
  end
end

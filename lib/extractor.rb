class Extractor
  def initialize(extractor_type, campaign)
    @campaign = campaign
    @extractor = case extractor_type
        when :twitter
          Extractors::Twitter.new
        end
  end
  
  def create_incident
    @result.each do |result|
      if analyze_message(result[:text], @extractor.mood)
        incident = @campaign.incidents.create!
        social_message = incident.social_messages.create_from_result(result, @extractor.provider_name)
        social_message.update_attribute(:historical_search_id, @extractor.historical_search.id)
      end
    end
  end
  
  def analyze_message(message, sentiment)
    result = SENTIMENT_ANALYSYS.review(message)
    result['mood'] == sentiment
  end
  
  def search
    @campaign.hashtags.each do |hashtag|
      @extractor.search(hashtag)
      @result = @extractor.result
      create_incident
    end
  end
  
end
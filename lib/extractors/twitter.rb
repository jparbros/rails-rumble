module Extractors
  class Twitter
    
    attr_reader :provider_name, :mood, :result, :historical_search
    
    def initialize
      @provider_name = 'twitter'
    end
    
    def extract_message
      search
      parse_message
    end

    def search(hashtag)
      @mood = hashtag.mood
      last_id = HistoricalSearch.most_recent_by_hashtag(hashtag.id).try(:last_message_id)
      @result ||= ::Twitter.search(hashtag.hashtag, result_type: 'recent', rpp: 100, include_entities: true, since_id: last_id).results
      @result.sort!{|x,y| y[:id] <=> x[:id] }
      @historical_search = HistoricalSearch.create(last_message_id: @result.last[:id], hashtag_id: hashtag.id, terms: hashtag.hashtag)
    end

  end
end
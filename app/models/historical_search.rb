class HistoricalSearch < ActiveRecord::Base
  
  #
  # Accessor
  #
  attr_accessible :hashtag_id, :last_message_id, :terms
  
  #
  # Scopes
  #
  def self.most_recent
    order('created_at DESC').first    
  end
  
  def self.by_hashtag(hashtag_id)
    where(hashtag_id: hashtag_id)
  end
  
  def self.most_recent_by_hashtag(hashtag_id)
    by_hashtag(hashtag_id).most_recent
  end
end

class TextSentimentAnalysis
  include Singleton

  def initialize
    @client = SentimentAnalysis::Client.new(:api_key => SETTINGS['sentiment_analysis']['api_key'])
  end

  def review(text)
    @client.review(text: text, format: :json).parsed_response
  end

end
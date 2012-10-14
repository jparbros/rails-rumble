class TextSentimentAnalysis
  include Singleton

  def initialize
    @client = SentimentAnalysis::Client.new(:api_key => 'FnovQu4sN6qtMqxpOhRC')
  end

  def review(text)
    @client.review(text: text, format: :json).parsed_response
  end

end
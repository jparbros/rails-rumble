class TwitterWorker
  include Sidekiq::Worker
  
  def perform
    Campaign.all.each do |campaign|
      extractor = Extractor.new :twitter, campaign
      extractor.search
    end
  end
end
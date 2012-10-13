class HashtagsController < ApplicationController

  before_filter :find_campaign

  def index
    @hashtags = Hashtag.all
  end

  def new
    @hashtag = Hashtag.new()
  end

  def create
    @hashtag = @campaign.hashtags.new(params[:hashtag])
    if @hashtag.save
      redirect_to campaign_hashtags_url(@campaign), notice: "Successfully create hashtag"
    else
      render :new, error: "Error creating campaign"
    end
  end

  def update
    @hashtag = @campaign.hashtags.find(params[:id])
    if @hashtag.update_attributes(params[:hashtag])
      redirect_to campaign_hashtags_url(@campaign), notice: "Successfully updated hashtag."
    else
      render :edit, error: "Error updating campaign"
    end

  end

  def destroy
    @hashtag = @campaign.hashtags.find(params[:id])
    @hashtag.destroy
    redirect_to campaign_hashtags_url(@campaign), notice: "Destroy campaign"
  end

  def edit
    @hashtag = @campaign.hashtags.find(params[:id])
  end

  private

  def find_campaign
    @campaign = Campaign.find(params[:campaign_id])
  end
end

class CampaignsController < ApplicationController

  def index
    @campaigns = Campaign.all
  end

  def new
    @campaign = Campaign.new()
  end

  def create
    @campaign = Campaign.new(params[:campaign])
    if @campaign.save
      redirect_to campaigns_url, notice: "Successfully create campaign"
    else
      render :new, error: "Error creating campaign"
    end
  end

  def update
    @campaign = Campaign.find(params[:id])
    if @campaign.update_attributes(params[:campaign])
      redirect_to campaigns_url, notice: "Successfully updated campaign."
    else
      render :edit, error: "Error updating campaign"
    end

  end

  def destroy
    @campaign = Campaign.find(params[:id])
    @campaign.destroy
    redirect_to campaign_url, notice: "Destroy campaign"
  end

  def edit
    @campaign = Campaign.find(params[:id])
  end
end

class IncidentsController < ApplicationController

  before_filter :find_campaign

  def index
    @incidents = Incident.all
  end

  def update
    @incident = @campaign.incidents.find(params[:id])
    if @incident.update_attributes(params[:incident])
      redirect_to campaign_incidents_url(@campaign), notice: "Successfully updated incident."
    else
      render :edit, error: "Error updating incident"
    end

  end

  def destroy
    @incident = @campaign.incidents.find(params[:id])
    @incident.destroy
    redirect_to campaign_incidents_url(@campaign), notice: "Destroy incident"
  end

  def edit
    @incident = @campaign.incidents.find(params[:id])
  end

  private

  def find_campaign
    @campaign = Campaign.find(params[:campaign_id])
  end
end

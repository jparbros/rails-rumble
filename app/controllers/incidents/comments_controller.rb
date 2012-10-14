class Incidents::CommentsController < ApplicationController

  before_filter :find_incident

  def new
    @comment = Comment.new()
  end

  def create
    @comment = @incident.comments.new(params[:comment])
    if @comment.save
      redirect_to campaign_incident_url(@incident.campaign, @incident), notice: "Successfully create comment"
    else
      render :new, error: "Error creating comment"
    end
  end

  def update
    @comment = @incident.comments.find(params[:id])
    if @comment.update_attributes(params[:comment])
      redirect_to campaign_incident_url(@incident.campaign, @incident), notice: "Successfully updated comment."
    else
      render :edit, error: "Error updating comment"
    end
  end

  def destroy
    @comment = @incident.comments.find(params[:id])
    @comment.destroy
    redirect_to campaign_incidents_url(@incident.campaign, @incident), notice: "Destroy comment"
  end

  def edit
    @comment = @incident.comments.find(params[:id])
  end

  private

  def find_incident
    @incident = Incident.find(params[:incident_id])
  end
end

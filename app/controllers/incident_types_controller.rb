class IncidentTypesController < ApplicationController

  def index
    @incident_types = IncidentType.all
  end

  def new
    @incident_type = IncidentType.new()
  end

  def create
    @incident_type = IncidentType.new(params[:incident_type])
    if @incident_type.save
      redirect_to incident_types_url, notice: "Successfully create incident type"
    else
      render :new, error: "Error creating incident type"
    end
  end

  def update
    @incident_type = IncidentType.find(params[:id])
    if @incident_type.update_attributes(params[:incident_type])
      redirect_to incident_types_url, notice: "Successfully updated incident type."
    else
      render :edit, error: "Error updating incident type"
    end

  end

  def destroy
    @incident_type = IncidentType.find(params[:id])
    @incident_type.destroy
    redirect_to incident_types_url, notice: "Destroy incident type"
  end

  def edit
    @incident_type = IncidentType.find(params[:id])
  end

end

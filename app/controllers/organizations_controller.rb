class OrganizationsController < ApplicationController

  def edit
    @organization = Organization.find(current_user.organization)
  end

  def update
    @organization = Organization.find(current_user.organization)
    if @organization.update_attributes(params[:organization])
      redirect_to root_url, notice: "Successfully updated organization."
    else
      render :edit, error: "Error updating organization"
    end
  end
end

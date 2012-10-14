class StatesController < ApplicationController
  def index
    @states = State.all
  end
  
  def new
    @state = State.new
  end
  
  def create
    @state = State.new params[:state]
    if @state.save
      redirect_to states_url, notice: 'State created successfully'
    else 
      render :new, error: 'Something went wrong creating a state'
    end
  end
  
  def edit
    @state = State.find(params[:id])
  end
  
  def update
    @state = State.find params[:id]
    if @state.update_attributes params[:state]
      redirect_to states_url, notice: 'State updated successfully'
    else
      render :edit, error: 'Something went wrong updating a state'
    end
  end
  
  def destroy
    @state = State.find params[:id]
    @state.destroy
    redirect_to states_url, notice: 'State deleted successfully'
  end
end

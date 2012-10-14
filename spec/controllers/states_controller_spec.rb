require 'spec_helper'

describe StatesController do
  let(:state) {State.create(name: 'Super Awesome')}
  let(:state_id) {state.id}
  let(:new_state) {mock State}
  
  describe "GET index" do
    it "show the list of states" do
      get :index
      response.should render_template('index')
    end
  end
  
  describe "GET new" do
    it "set a new state" do
      get :new
      assigns(:state).should be_an_instance_of State
      response.should render_template('new')
    end
  end
  
  describe "POST create" do
    context "fails" do
      let(:params) {{state: {}}}
      it "show a error message and render the form" do
        post :create, params
        response.should render_template('new')
        flash.should_not be_nil
      end
    end
    
    context "success" do
      let(:params) {{state: {name: 'Super Duper State'}}}
      it "create and redirect" do
        post :create, params
        response.should be_redirect
        flash.should_not be_nil
      end
    end
  end

  describe "GET edit" do    
    it "find the state and render the form" do
      get :edit, id: state_id
      assigns(:state).should == state
      response.should render_template('edit')
    end
  end
  
  describe "PUT update" do
    context "fails" do
      let(:params) {{id: state_id, state: {name: ''}}}

      it "render the form" do
        put :update, params
        response.should render_template('edit')
        flash.should_not be_nil
      end
    end
    
    context "success" do
      let(:params) {{id: state_id, state: {name: 'Super Duper State'}}}

      it "redirect to index" do
        post :create, params
        response.should be_redirect
        flash.should_not be_nil
      end
    end
  end
  
  describe "DELETE destroy" do
    it "delete the record" do
      delete :destroy, id: state_id
      response.should be_redirect
    end
  end
end

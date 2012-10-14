require 'spec_helper'

describe IncidentTypesController do
  let(:organization) { Organization.make! }

  describe "GET index" do
    it "should see incident types list" do
      IncidentType.should_receive(:all)
      get :index, organization_id: organization.id
      response.should render_template(:index)
    end
  end

  describe "GET new" do
    it "should assign a new instance of incident types model" do
      get :new, organization_id: organization.id
      assigns("incident_type").should be_instance_of IncidentType
    end
  end

  describe "POST create" do
    let(:params) {
      {incident_type:
           {name: "incident type new"},
       organization_id: organization.id
      }
    }
    let(:incident_type){
      mock IncidentType
    }

    context "successfully" do
      it "create a new incident type model" do
        IncidentType.should_receive(:new).and_return(incident_type)
        incident_type.should_receive(:save).and_return(true)

        post :create, params
        response.should be_redirect
      end
    end

    context "Error" do
      it "error creating a new incident type model" do
        IncidentType.should_receive(:new).and_return(incident_type)
        incident_type.should_receive(:save).and_return(false)

        post :create, params
        response.should render_template(:new)
      end
    end
  end

  describe "PUT update" do
    let(:params) {
      {   id: incident_type.id,
          incident_type:             {
              name: "new incident"
          },
          organization_id: organization.id
      }
    }
    let(:incident_type){
      IncidentType.create(organization_id: organization.id, name: "new incident")
    }

    context "successfully" do
      it "update an incident type" do
        put :update, params
        assigns(:incident_type).reload.name.should  == "new incident"
      end
    end
  end

  describe "DELETE destroy" do
    let(:params) {
      {   id: incident_type.id
      }
    }
    let(:incident_type){
      IncidentType.create(organization_id: organization.id, name: "incidents")
    }

    it "delete an incident" do
      delete :destroy, params
      response.should be_redirect
    end
  end

end

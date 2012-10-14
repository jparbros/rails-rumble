require 'spec_helper'

describe IncidentsController do
  let(:campaign) { Campaign.make! }

  describe "GET index" do
    it "should see incident list" do
      Incident.should_receive(:all)
      get :index, campaign_id: campaign.id
      response.should render_template(:index)
    end
  end

  describe "PUT update" do
    let(:params) {
      {   id: incident.id,
          incident: {
              title: "new incident",
              description: "new incident description"
          },
          campaign_id: campaign.id
      }
    }
    let(:incident){
      Incident.create(campaign_id: campaign.id, title: "new incident", description: "new incident description")
    }

    context "successfully" do
      it "update an incident model" do
        put :update, params
        assigns(:incident).reload.title.should  == "new incident"
        assigns(:incident).reload.description.should  == "new incident description"
      end
    end
  end

  describe "DELETE destroy" do
    let(:params) {
      {   id: incident.id,
          campaign_id: campaign.id
      }
    }
    let(:incident){
      Incident.create(campaign_id: campaign.id, title: "new incident", description: "new incident description")
    }

    it "delete an incident" do
      delete :destroy, params
      response.should be_redirect
    end
  end
end

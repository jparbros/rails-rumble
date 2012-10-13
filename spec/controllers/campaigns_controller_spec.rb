require "spec_helper"

describe CampaignsController do
  describe "GET index" do
    it "should see campaigns list" do
      Campaign.should_receive(:all)
      get :index
      response.should render_template(:index)
    end
  end

  describe "GET new" do
    it "should assign a new instance of campaign model" do
      get :new
      assigns("campaign").should be_instance_of Campaign
    end
  end

  describe "POST create" do
    let(:params) {
      {campaign:
           {name: "Campaign new",
            description: "creating new campaign"}
      }
    }
    let(:campaign){
      mock Campaign
    }

    context "successfully" do
      it "create a new campaign model" do
        Campaign.should_receive(:new).and_return(campaign)
        campaign.should_receive(:save).and_return(true)

        post :create, params
        response.should be_redirect
      end
    end

    context "Error" do
      it "error creating a new campaign model" do
        Campaign.should_receive(:new).and_return(campaign)
        campaign.should_receive(:save).and_return(false)

        post :create, params
        response.should render_template(:new)
      end
    end
  end

  describe "PUT update" do
    let(:campaign) { Campaign.make! }

    let(:params) {
      {   id: campaign.id,
          campaign:
           {name: "Campaign new",
            description: "creating new campaign"}
      }
    }

    context "successfully" do
      it "update a campaign model" do
        campaign
        Campaign.should_receive(:find).and_return(campaign)
        campaign.should_receive(:update_attributes).and_return(true)

        put :update, params
        response.should be_redirect
      end
    end

    context "Error" do
      it "error updating a campaign model" do
        campaign
        Campaign.should_receive(:find).and_return(campaign)
        campaign.should_receive(:update_attributes).and_return(false)

        put :update, params
        response.should render_template(:edit)
      end
    end
  end

  describe "DELETE destroy" do
    let(:campaign){
      Campaign.make
    }

    it "delete a campaign model" do

      Campaign.should_receive(:find).and_return(campaign)
      campaign.should_receive(:destroy)

      delete :destroy, id: 1
      response.should be_redirect
    end
  end
end
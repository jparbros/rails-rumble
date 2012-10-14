require 'spec_helper'

describe HashtagsController do
  let(:campaign) { Campaign.make! }

  describe "GET index" do
    it "should see hashtags list" do
      Hashtag.should_receive(:all)
      get :index, campaign_id: campaign.id
      response.should render_template(:index)
    end
  end

  describe "GET new" do
    it "should assign a new instance of hashtag model" do
      get :new, campaign_id: campaign.id
      assigns("hashtag").should be_instance_of Hashtag
    end
  end

  describe "POST create" do
    let(:params) {
      {hashtag:
           {hashtag: "#NewHashtag"},
       campaign_id: campaign.id
      }
    }
    let(:hashtag){
      mock Hashtag
    }

    context "successfully" do
      it "create a new hashtag model" do
        Hashtag.should_receive(:new).and_return(hashtag)
        hashtag.should_receive(:save).and_return(true)

        post :create, params
        response.should be_redirect
      end
    end

    context "Error" do
      it "error creating a new hashtag model" do
        Hashtag.should_receive(:new).and_return(hashtag)
        hashtag.should_receive(:save).and_return(false)

        post :create, params
        response.should render_template(:new)
      end
    end
  end

  describe "PUT update" do
    let(:params) {
      {   id: hashtag.id,
          hashtag:             {
              hashtag: "#NewHashtag"
          },
          campaign_id: campaign.id
      }
    }
    let(:hashtag){
      Hashtag.create(campaign_id: campaign.id, hashtag: "ponies!")
    }

    context "successfully" do
      it "update a hashtag model" do
        put :update, params
        assigns(:hashtag).reload.hashtag.should  == "#NewHashtag"
      end
    end
  end

  describe "DELETE destroy" do
    let(:params) {
      {   id: hashtag.id,
          campaign_id: campaign.id
      }
    }
    let(:hashtag){
      Hashtag.create(campaign_id: campaign.id, hashtag: "ponies!")
    }

    it "delete a hashtag model" do
      delete :destroy, params
      response.should be_redirect
    end
  end

end
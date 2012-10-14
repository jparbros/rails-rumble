class AddCampaingIdToIncidents < ActiveRecord::Migration
  def change
    add_column :incidents, :campaign_id, :integer
  end
end

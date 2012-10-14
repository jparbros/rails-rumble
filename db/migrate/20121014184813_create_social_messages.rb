class CreateSocialMessages < ActiveRecord::Migration
  def change
    create_table :social_messages do |t|
      t.string :provider
      t.string :social_id
      t.text :content
      t.integer :incident_id
      t.integer :historical_search_id
      t.string :media_url
      t.string :external_url

      t.timestamps
    end
  end
end

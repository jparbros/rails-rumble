class CreateExternalUrls < ActiveRecord::Migration
  def change
    create_table :external_urls do |t|
      t.string :url
      t.integer :social_message_id

      t.timestamps
    end
  end
end

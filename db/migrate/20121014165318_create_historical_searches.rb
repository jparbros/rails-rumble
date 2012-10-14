class CreateHistoricalSearches < ActiveRecord::Migration
  def change
    create_table :historical_searches do |t|
      t.integer :hashtag_id
      t.text :terms
      t.integer :last_message_id

      t.timestamps
    end
  end
end

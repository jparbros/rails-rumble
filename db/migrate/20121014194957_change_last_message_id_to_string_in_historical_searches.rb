class ChangeLastMessageIdToStringInHistoricalSearches < ActiveRecord::Migration
  def up
    change_column :historical_searches, :last_message_id, :string
  end

  def down
    change_column :historical_searches, :last_message_id, :integer
  end
end
class AddMoodToHashtags < ActiveRecord::Migration
  def change
    add_column :hashtags, :mood, :string
  end
end

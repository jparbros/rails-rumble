class CreateHashtags < ActiveRecord::Migration
  def change
    create_table :hashtags do |t|
      t.string :hashtag
      t.references :campaign
      t.timestamps
    end
  end
end

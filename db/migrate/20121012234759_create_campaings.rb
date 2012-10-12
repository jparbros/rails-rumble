class CreateCampaings < ActiveRecord::Migration
  def change
    create_table :campaings do |t|
      t.string :name
      t.text :description
      t.references :Organization
      t.timestamps
    end
  end
end

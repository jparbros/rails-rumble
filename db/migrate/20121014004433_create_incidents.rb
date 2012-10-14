class CreateIncidents < ActiveRecord::Migration
  def change
    create_table :incidents do |t|
      t.string :title
      t.text :description
      t.references :incident_type
      t.references :state
      t.timestamps
    end
  end
end

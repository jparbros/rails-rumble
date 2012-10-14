class CreateAuthentications < ActiveRecord::Migration
  def change
    create_table :authentications do |t|
      t.string :provider
      t.string :uid
      t.string :organization_id
      t.string :token
      t.string :secret

      t.timestamps
    end
  end
end

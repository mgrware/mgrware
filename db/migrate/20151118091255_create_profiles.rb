class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :name
      t.string :last_name
      t.string :about

      t.timestamps null: false
    end
  end
end

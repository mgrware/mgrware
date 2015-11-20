class AddColumnToProfile < ActiveRecord::Migration
   def change
        add_column :profiles, :birthday, :datetime
        add_column :profiles, :gender, :string
        add_column :profiles, :status, :string
        add_column :profiles, :jobdesk, :string
    end
end
